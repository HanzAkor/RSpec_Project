require 'music_library'
require 'track'

RSpec.describe 'integration' do
  context 'when we add tracks to the library' do
    it 'comes back in the list' do
      music_library = MusicLibrary.new
      track_1 = Track.new("my_title_1", "my_artist_1")
      track_2 = Track.new("my_title_2", "my_artist_2")
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.all).to eq [track_1, track_2]
    end
  end

  context 'with some tracks added' do
    it 'searches for those tracks by full title' do
      music_library = MusicLibrary.new
      track_1 = Track.new("my_title_1", "my_artist_1")
      track_2 = Track.new("my_title_2", "my_artist_2")
      music_library.add(track_1)
      music_library.add(track_2)
      result = music_library.search_by_title("title_2")
      expect(result).to eq [track_2]
    end
  end

  context 'with some tracks added' do
    it 'searches for those tracks by partial title' do
      music_library = MusicLibrary.new
      track_1 = Track.new("my_title_1", "my_artist_1")
      track_2 = Track.new("my_title_2", "my_artist_2")
      music_library.add(track_1)
      music_library.add(track_2)
      result = music_library.search_by_title("my_title_2")
      expect(result).to eq [track_2]
    end
  end

  context 'where there are no tracks matching' do
    it 'yeilds an empty list when searching' do
      music_library = MusicLibrary.new
      track_1 = Track.new("my_title_1", "my_artist_1")
      music_library.add(track_1)
      result = music_library.search_by_title("fred")
      expect(result).to eq []
    end

  end

end
