require 'tracks_list'

RSpec.describe TracksList do
  describe 'add' do
    context 'when given no tracks' do
      it 'has an empty list' do
        tracks_list = TracksList.new
        expect(tracks_list.list).to eq []
      end
    end

    context 'when given a track' do
      it 'adds track to the list' do
        tracks_list = TracksList.new
        tracks_list.add("Light of the Seven")
        expect(tracks_list.list).to eq ["Light of the Seven"]
      end
    end

    context 'when given two tracks' do
      it 'add tracks to the list' do
        tracks_list = TracksList.new
        tracks_list.add("Light of the Seven")
        tracks_list.add("The Night King")
        expect(tracks_list.list).to eq ["Light of the Seven", "The Night King"]
      end
    end
  end

end