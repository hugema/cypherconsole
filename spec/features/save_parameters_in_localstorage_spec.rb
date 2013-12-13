feature 'Save form parameters in localStorage', :js => true do
  scenario 'Input form parameters and process form' do
    visit '/'
    fill_in 'uri',          :with => 'http://localhost:7474/db/data/cypher'
    fill_in 'query',        :with => 'START n=node({id}) RETURN n'
    click_on 'Run query'
    Capybara.reset!
  end

  scenario 'Check that form parameters are back from localStorage' do
    visit '/'
    find_field('uri').value == 'http://localhost:7474/db/data/cypher'
    page.evaluate_script("localStorage.removeItem('uri')");
    find_field('query').value == 'START n=node({id}) RETURN n'
    page.evaluate_script("localStorage.removeItem('query')");
  end
end
