module Seb
  class Transaction
    attr_reader :date, :id, :message, :amount, :balance

    def initialize(data)
      @date = Date.parse data.first
      _, _, @id, @message, @amount, @balance = data
    end

    def income?
      amount > 0
    end

    def expense?
      amount < 0
    end
  end
end
