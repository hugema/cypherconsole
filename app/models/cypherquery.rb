require 'net/http'
require 'uri'

class CypherQuery
  ERR_NO_SERVER_URL = 'Warning: no URL or bad URL!'
  ERR_EMPTY_QUERY   = 'Warning: empty query!'

  def initialize(uri, query, parameters)
    @uri = uri
    @query = String.new(query)
    @query.gsub!(/\n/,' ')
    @query.gsub!(/\r/,' ')
    @query.gsub!(/\s+/,' ')
    @parameters = parameters
  end

  def query
    error = ERR_NO_SERVER_URL unless (@uri =~ /^#{URI::regexp}$/)
    error = ERR_EMPTY_QUERY if (@query.to_s == '')
    if error == nil
      if @parameters.to_s == ''
        data = "{\"query\": \"#{@query}\"}"
      else
        data = "{\"query\": \"#{@query}\", \"params\": {#{@parameters}}}"
      end
      headers = { 'content-type' => 'application/json' }
      u = URI.parse(@uri)
      @json = Net::HTTP.new(u.host, u.port).post(u.path, data, headers).body
      format
    end
    return @json, @data_columns, @data_values, error
  end

  def format
    ruby = JSON.parse @json 
    @data_columns = ruby['columns']
    @data_values  = ruby['data']
  end
end
