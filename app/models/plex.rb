class Plex
  include HTTParty
  base_uri 'testapi.plexonline.com'

  def initialize
    @auth = { username: ENV["PLEX_USER_NAME"], password: ENV["PLEX_PASSWORD"] }
  end

  def questions
    test_array = []
    data = HTTParty.get("http://testapi.plexonline.com/DataSource/Service.asmx/ExecuteDataSourceByDataSourceKey?dataSourceKey=6265", basic_auth: @auth)
    puts "here is the httparty data"
    puts "#{data}"
    test_array << data["ExecuteDataSourceResult"]["ResultSets"]["ResultSet"]["Rows"]["Row"][0]["Columns"]["Column"][0]["Value"].to_i
    test_array << data["ExecuteDataSourceResult"]["ResultSets"]["ResultSet"]["Rows"]["Row"][0]["Columns"]["Column"][3]["Value"].to_i
    test_array << data["ExecuteDataSourceResult"]["ResultSets"]["ResultSet"]["Rows"]["Row"][0]["Columns"]["Column"][4]["Value"].to_i
    test_array << data["ExecuteDataSourceResult"]["ResultSets"]["ResultSet"]["Rows"]["Row"][0]["Columns"]["Column"][18]["Value"].to_i
    test_array << data["ExecuteDataSourceResult"]["ResultSets"]["ResultSet"]["Rows"]["Row"][0]["Columns"]["Column"][5]["Value"].to_i
    test_array
  end

  def users
    self.class.get("/2.2/users", @auth)
  end
end
