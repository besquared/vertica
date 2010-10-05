require File.join(File.dirname(__FILE__), "spec_helper")

describe Vertica::Connection do
  before(:each) do
    @connection = Vertica::Connection.new(
      Configuration[:host], Configuration[:port],
      Configuration[:database], Configuration[:username],
      Configuration[:password], false, false
    )
  end
  
  it "should" do
    r = c.query("SELECT * FROM test_table")
    assert_equal 1, r.row_count
    assert_equal 2, r.columns.length
    assert_equal :in, r.columns[0].data_type
    assert_equal 'id', r.columns[0].name
    assert_equal :varchar, r.columns[1].data_type
    assert_equal 'name', r.columns[1].name
    assert_equal [[1, 'matt']], r.rows
    c.close
    
  end
end