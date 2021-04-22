feature 'adding a bookmark' do
  scenario 'add a bookmark to current list' do
    visit('/bookmarks/new')
    fill_in('url', with: 'https://www.youtube.com')
    click_button('Add bookmark')
    
    expect(page).to have_content 'https://www.youtube.com'
  end
end
