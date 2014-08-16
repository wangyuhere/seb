require 'thor'
require 'terminal-table'

module Seb
  module Cli
    class App < Thor

      desc 'report FILE', 'Show the report of the xlsx file'
      def report(file)
        report = Report.new file
        puts report.summary
        puts report.group_by_month
      end

      desc 'summary FILE', 'Show the summary of the xlsx file'
      def summary(file)
        puts Report.new(file).summary
      end

      desc 'version', 'Show version'
      def version
        puts "seb v#{VERSION}"
      end

    end

    class Report
      attr_reader :doc

      def initialize(file)
        @doc = Document.new file
      end

      def summary
        dates = doc.transactions.map(&:date)

        Terminal::Table.new do |t|
          t.title = 'Summary'
          t << ['Name', doc.name]
          t << ['Account', doc.account]
          t << ['Dates', "#{dates.min} ~ #{dates.max}"]
          t << ['Balance', doc.balance]
          t << ['Expense', doc.total[:expense]]
          t << ['Income', doc.total[:income]]
        end
      end

      def group_by_month
        rows = doc.total_by_month.map do |r|
          [
            r[:month],
            r[:expense],
            r[:income],
            (r[:income] - r[:expense]).round(2)
          ]
        end

        Terminal::Table.new({
          title: 'Group by Month',
          headings: [:Month, :Expense, :Income, :Balance],
          rows: rows
        })
      end
    end
  end

end
