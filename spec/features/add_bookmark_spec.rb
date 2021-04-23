feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.youtube.com')
    fill_in('title', with: 'Youtube')
    click_button('Add Bookmark')

    expect(page).to have_link('Youtube', href: 'http://www.youtube.com')
  end
end
