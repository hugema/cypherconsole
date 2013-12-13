feature 'Run query on Neo4j' do
  SERVER_URI = 'http://localhost:7474/db/data/cypher'

  background do
    data = "{\"query\": \"CREATE (a {name : 'NODE_WITH_A_PROPERTY'}) RETURN ID(a)\"}"
    u = URI.parse(SERVER_URI)
    json = Net::HTTP.new(u.host, u.port).post(u.path, data, { 'Content-Type' => 'application/json' }).body
    ruby = JSON.parse json
    @node_id = ruby["data"][0][0]
  end

  scenario 'Put server, query and submit form' do
    visit '/'
    fill_in 'uri',          :with => SERVER_URI
    fill_in 'query',        :with => 'START n=node(*) RETURN n'
    click_on 'Run query'
    expect(page).to have_content '"NODE_WITH_A_PROPERTY"'
  end

  after do
    data = "{\"query\": \"START n = node(" + @node_id.to_s + ") DELETE n\"}"
    u = URI.parse(SERVER_URI)
    json = Net::HTTP.new(u.host, u.port).post(u.path, data, { 'Content-Type' => 'application/json' }).body
  end
end
