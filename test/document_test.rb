require 'minitest/autorun'
require 'seb'

class DocumentTest < Minitest::Test
  SAMPLE_FILE = File.join File.dirname(__FILE__), 'sample.xlsx'

  def setup
    @doc = Seb::Document.new SAMPLE_FILE
  end

  def test_parse
    assert_equal 'Rex', @doc.name
    assert_equal '12345678', @doc.account
    assert_equal 1000.0, @doc.balance
    assert_equal 7, @doc.transactions.size
  end

  def test_total
    total = {income: 1100.0, expense: 500.0}
    assert_equal total, @doc.total
  end

  def test_total_by_month
    data = @doc.total_by_month
    first_data = {month: '2014-08', income: 1000.0, expense: 200.0}
    last_data = {month: '2014-04', income: 100.0, expense: 0.0}

    assert_equal 5, data.size
    assert_equal first_data, data.first
    assert_equal last_data, data.last
  end

  def test_total_by_month_with_range
    data = @doc.total_by_month Date.parse('2014-07-01')..Date.parse('2014-08-31')
    last_data = {month: '2014-07', income: 0.0, expense: 100.0}

    assert_equal 2, data.size
    assert_equal last_data, data.last
  end

end
