feature 'Delete a bookmark' do
  scenario 'can delete bookmark from list' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.youtube.com')
    fill_in('title', with: 'Youtube')
    click_button('Add Bookmark')
    click_button('Delete')
    expect(page).not_to have_content ('Youtube')
  end
end
    