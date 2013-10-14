feature 'Save form parameters in localStorage', :js => true do
  scenario 'Input form parameters and process form' do
    visit '/'
    fill_in 'uri',          :with => 'http://localhost:7474/'
    fill_in 'query',        :with => 'START n=node({id}) RETURN n'
    fill_in 'node_id',      :with => '1'
    click_on 'Run query'
    Capybara.reset!
  end

  scenario 'Check that form parameters are back from localStorage' do
    visit '/'
    find_field('uri').value == 'http://localhost:7474/'
    page.evaluate_script("localStorage.removeItem('uri')");
    find_field('query').value == 'START n=node({id}) RETURN n'
    page.evaluate_script("localStorage.removeItem('query')");
    find_field('node_id').value == '1'
    page.evaluate_script("localStorage.removeItem('node_id')");
  end
end
