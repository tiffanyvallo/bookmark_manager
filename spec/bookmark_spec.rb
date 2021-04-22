require 'bookmark'

describe Bookmark do
  describe '#.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmarks= Bookmark.all
      expect(bookmarks).to include 'http://www.makersacademy.com'
      expect(bookmarks).to include 'http://www.destroyallsoftware.com'
      expect(bookmarks).to include 'http://www.google.com'
    end
  end
  describe '#create' do
    it 'can add a bookmark into the database' do
      Bookmark.create(url: 'https://www.youtube.com')
      expect(Bookmark.all).to include 'https://www.youtube.com'
    end
  end
end
