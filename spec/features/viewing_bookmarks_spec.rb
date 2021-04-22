feature 'testing root route, Bookmark Manager view' do
  scenario 'it prints title' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end

feature 'testing bookmarks route' do
  scenario 'shows a list of bookmarks' do
    Bookmark.create(url: 'http://www.makersacademy.com')
    Bookmark.create(url: 'http://www.destroyallsoftware.com')
    Bookmark.create(url: 'http://www.google.com')
    
    visit('/bookmarks')
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
    expect(page).to have_content 'http://www.google.com'
  end
end
