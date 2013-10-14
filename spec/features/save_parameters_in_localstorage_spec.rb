feature 'Save server URL in localStorage', :js => true do
  scenario 'Put server URL in form and process form' do
    visit '/'
    fill_in 'uri', :with => 'http://localhost:7474/'
    click_on 'Run query'
    Capybara.reset!
  end

  scenario 'Check that server URL is back from localStorage' do
    visit '/'
    find_field('uri').value == 'http://localhost:7474/'
    page.evaluate_script("localStorage.removeItem('uri')");
  end
end
