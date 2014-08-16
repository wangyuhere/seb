require 'roo'
require 'seb/transaction'

module Seb
  class Document
    attr_reader :file, :data, :name, :account, :balance, :transactions

    def initialize(file)
      @file = file
      @data = Roo::Excelx.new file
    end

    def name
      @name ||= data.cell 1, 1
    end

    def account
      @account ||= data.cell 2, 1
    end

    def balance
      @balance ||= data.cell 2, 2
    end

    def transactions
      @transactions ||= parse_transactions
    end

    def total
      @total ||= { income: total_income, expense: total_expense }
    end

    def total_by_month(date_range=nil)
      if date_range.nil?
        transactions
      else
        transactions.select{ |t| date_range.cover? t.date }
      end.group_by do |t|
        t.date.strftime '%Y-%m'
      end.map do |month, data|
        {
          month: month,
          income: total_income(data).round(2),
          expense: total_expense(data).round(2)
        }
      end
    end

    def to_s
      "<Seb::Document name=#{name} account=#{account} balance=#{balance}>"
    end

    private

    def total_income(transactions=transactions)
      transactions.select(&:income?).map(&:amount).sum
    end

    def total_expense(transactions=transactions)
      transactions.select(&:expense?).map(&:amount).sum * -1
    end

    def parse_transactions
      first_row = 6
      last_row = data.last_row
      (first_row..last_row).map {|i| Transaction.new data.row(i) }
    end
  end
end
