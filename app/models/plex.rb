class Plex
  include HTTParty
  base_uri 'testapi.plexonline.com'

  def initialize
    @auth = { username: ENV["PLEX_USER_NAME"], password: ENV["PLEX_PASSWORD"] }
  end

  def questions
    test_array = []
    data = self.class.get("/DataSource/Service.asmx/ExecuteDataSourceByDataSourceKey?dataSourceKey=6265", basic_auth: @auth)
    test_array << data["ExecuteDataSourceResult"]["ResultSets"]["ResultSet"]["Rows"]["Row"][0]["Columns"]["Column"][0]["Value"].to_i
    # test_array << data["ExecuteDataSourceResult"]["ResultSets"]["ResultSet"]["Rows"]["Row"][0]["Columns"]["Column"][3]["Value"].to_i
    # test_array << data["ExecuteDataSourceResult"]["ResultSets"]["ResultSet"]["Rows"]["Row"][0]["Columns"]["Column"][4]["Value"].to_i
    # test_array << data["ExecuteDataSourceResult"]["ResultSets"]["ResultSet"]["Rows"]["Row"][0]["Columns"]["Column"][18]["Value"].to_i
    # test_array
  end

  def users
    self.class.get("/2.2/users", @auth)
  end
end
