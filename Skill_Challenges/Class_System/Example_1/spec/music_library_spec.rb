require 'music_library'

RSpec .describe MusicLibrary do
  context 'initially' do
    it 'is empty' do
      music_library = MusicLibrary.new
      expect(music_library.all).to eq []
    end


     it 'responds to searches with an empty list' do
      music_library = MusicLibrary.new
      track_1 = Track.new("my_title_1", "my_artist_1")
      expect(music_library.search_by_title("fred")).to eq []
    end
  end
end