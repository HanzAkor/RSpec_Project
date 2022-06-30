require 'diary_entry'

RSpec.describe DiaryEntry do

  it 'constructs' do
    diary_entry = DiaryEntry.new("my title", "my contents")
    expect(diary_entry.title).to eq "my title"
    expect(diary_entry.contents).to eq "my contents"
  end

  describe '#count_words' do
    it 'counts the number of words in contents' do
      diary_entry = DiaryEntry.new("my title", "one two three four")
      expect(diary_entry.count_words).to eq 4
    end

    it 'returns zero when contents is empty' do
      diary_entry = DiaryEntry.new("my title", "")
      expect(diary_entry.count_words).to eq 0
    end
  end

  describe '#reading_time' do
    it "fails" do
      diary_entry = DiaryEntry.new("my title", "hello world")
      expect { diary_entry.reading_time(0) }.to raise_error "WPM must be positive."
    end
    context 'when contents is empty' do
      it 'returns zero' do
        diary_entry = DiaryEntry.new("my_title", "")
        expect(diary_entry.reading_time(200)).to eq 0
      end
    end

    context 'given a wpm of some sensible number of words (200)' do
      it 'returns the ceiling of the number of minutes it takes to read the contents' do
        diary_entry = DiaryEntry.new("my_title", "one")
        expect(diary_entry.reading_time(200)).to eq 1
      end

      it 'returns the ceiling of the number of minutes it takes to read the contents' do
        diary_entry = DiaryEntry.new("my_title", ("one " * 200).rstrip)
        p ("one " * 10).rstrip
        expect(diary_entry.reading_time(200)).to eq 1
      end

      it 'returns the ceiling of the number of minutes it takes to read the contents' do
        diary_entry = DiaryEntry.new("my_title", ("one " * 550).rstrip)
        expect(diary_entry.reading_time(200)).to eq 3
      end
    end
  end

  describe '#reading_chunk' do
    context 'with a contents readable within the given time' do
      it 'returns the full contents' do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        chunk = diary_entry.reading_chunk(200, 1)
        expect(chunk).to eq "one two three"
      end
    end

    context 'given a wpm of 0' do
      it "fails" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        expect { diary_entry.reading_chunk(0, 5) }.to raise_error "Reading speed must be above zero."
      end
    end

    context 'with a contents unreadable within the given time' do
      it 'returns a readable chunk' do
        diary_entry = DiaryEntry.new("my_title", "one two")
        chunk = diary_entry.reading_chunk(2, 1)
        expect(chunk).to eq "one two"
      end

      it 'returns the next chunk next time we are asked' do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        diary_entry.reading_chunk(2, 1)
        chunk = diary_entry.reading_chunk(2, 1)
        expect(chunk).to eq "three"
      end

      it 'restarts after reading the whole contents' do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        diary_entry.reading_chunk(2, 1)
        diary_entry.reading_chunk(2, 1)        
        chunk = diary_entry.reading_chunk(2, 1)
        expect(chunk).to eq "one two"
      end

      it 'restarts if it finishes exactly on the end' do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        diary_entry.reading_chunk(2, 1)
        diary_entry.reading_chunk(1, 1)        
        chunk = diary_entry.reading_chunk(2, 1)
        expect(chunk).to eq "one two"
      end

    end
  end

end