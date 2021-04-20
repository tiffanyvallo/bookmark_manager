require 'bookmark'

describe Bookmark do
  describe '#can show an array of bookmarks' do
    it 'can show an array of hardcoded bookmarks' do
      expect(Bookmark.all).to include 'http://www.makersacademy.com'
      expect(Bookmark.all).to include 'http://www.destroyallsoftware.com'
      expect(Bookmark.all).to include 'http://www.google.com'
    end
  end
end
