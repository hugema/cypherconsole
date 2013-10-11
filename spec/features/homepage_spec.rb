feature "the homepage is shown" do
  scenario "displays the homepage" do
    visit '/'
    expect(page).to have_content 'Neo4j URL'
  end
end
