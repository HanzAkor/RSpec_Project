require 'diary'
require 'diary_entry'

RSpec.describe 'integrated_diary' do
  context 'after adding some entries' do
    it 'lists out entries added' do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my title", "my_contents")
      diary_entry_2 = DiaryEntry.new("my title 2", "my_contents 2")      
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.all).to eq [diary_entry_1, diary_entry_2]
    end
  end

  describe 'counting behaviour' do
    it 'counts the words in all diary entries contents' do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my title", "my contents")
      diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")      
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.count_words).to eq 5
    end
  end

  describe 'reading time behaviour' do
    it 'calculates the reading time for all the diary entries' do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my title", ("one " * 200).rstrip)
      diary_entry_2 = DiaryEntry.new("my title 2", ("one " * 550).rstrip)
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.reading_time(200)).to eq 4
    end

    context 'where it fits exactly' do
      it 'calculates the reading time for all the diary entries' do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("my title", "my contents 1")
        diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
        expect(diary.reading_time(2)).to eq 3
      end
    end

    context 'where it does not fit exactly' do
      it 'calculates the reading time for all the diary entries' do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("my title", "my contents ")
        diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
        expect(diary.reading_time(2)).to eq 3
      end
    end

    context 'when no wpm given' do
      it "fails" do
        diary = Diary.new
        expect { diary.reading_time(0) }.to raise_error "WPM must be positive."
      end
    end
  end

  describe 'best reading time entry behaviour' do
    it 'fails where wpm is 0' do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my title", "my contents")        
      diary.add(diary_entry_1)
      expect { diary.find_best_entry_for_reading_time(0, 1) }.to raise_error  "WPM must be positive."
    end

    context 'where we just have one entry and it is exactly readable in the time' do
      it 'returns that entry' do 
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("my title", "my contents")
        diary.add(diary_entry_1)
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq diary_entry_1
      end
    end

    context 'where we just have one entry and it is unreadable in the time' do
      it 'returns nil' do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("my title", "my contents longer")
        diary.add(diary_entry_1)
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq nil
      end
    end

    context 'where we have multiple entries' do
      it 'returns the longest readable entry within the time' do 
        diary = Diary.new
        best_entry = DiaryEntry.new("my title", "one two")
        diary.add(best_entry)
        diary.add(DiaryEntry.new("my title", "one"))
        diary.add(DiaryEntry.new("my title", "one two three"))
        diary.add(DiaryEntry.new("my title", "one two three four"))
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq best_entry
      end
    end
  end
end