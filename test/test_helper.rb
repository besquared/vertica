require "test/unit"
$:.unshift(File.dirname(__FILE__) + '/../lib')
require "vertica"
 
class Test::Unit::TestCase
  
  TEST_CONNECTION_USER     = 'dbadmin'
  TEST_CONNECTION_PASSWORD = 'yamittome'
  TEST_CONNECTION_HOST     = 'edb-001'
  TEST_CONNECTION_PORT     = 5433
  TEST_CONNECTION_DATABASE = 'yamhouse'

  TEST_CONNECTION_HASH = {
    :user     => TEST_CONNECTION_USER,
    :password => TEST_CONNECTION_PASSWORD,
    :host     => TEST_CONNECTION_HOST,
    :port     => TEST_CONNECTION_PORT,
    :database => TEST_CONNECTION_DATABASE
  }

end

class StringIO
  include Vertica::BitHelper
end
