# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a user
> So that I can record my experiences
> I want to keep a regular diary

> As a user
> So that I can reflect on my experiences
> I want to read my past diary entries

> As a user
> So that I can reflect on my experiences in my busy day
> I want to select diary entries to read based on how much time I have and my reading speed

> As a user
> So that I can keep track of my tasks
> I want to keep a todo list along with my diary

> As a user
> So that I can keep track of my contacts
> I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
Diary
- add(entry)
- add(task)
- count_words
- reading_speed(wpm, minutes)
- best_entry_for_reading_time => [readable entries.. ]


DiaryEntry(title, contents, contacts)
- title
- contents
- count_words
- reading_time
- contacts


TodoList
- add(task)
- all => [all tasks...]

ContactList
- add(contact_details)
- all => [list of contacts ..]

Contact(name, number)
- name
- number
- format => "Name: mobile number"

```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
    # ...
  end

  def add_entry(entry) # entry is an instance of DiaryEntry
    # entry gets added to the diary
    # Returns nothing
  end

  def count_words
   # Returns the number of words in all diary entries
   # Makes use of the 'count_words' method on DiaryEntry
  end

  def reading_time(wpm) # wpm = Integer representing number of words user can read per minute
    # Returns integer representing estimate of the reading time in minutes if user were to read all entries in the diary
  end

  def find_best_entry_for_reading_time(wpm, minutes)
      # wpm = Integer representing number of words user can read per minuteend
      # minutes = Integer representing number of minutes the user has to read
      # Returns an instance of diary entry representing the entry that is closest to, but not over, the length that the user could read in the minutes they have available, given their reading speed
  end

  def add_tasks(todolist) # todolist = instance of TodoList
    # todolist gets added to the diary
    # Returns nothing
  end

  def format_diary
    # Returns all contents including todolist
  end
end


class DiaryEntry
  def initialize(title, contents, contacts) # title, contents and contacts = strings
    # ...
  end

  def title
    # Returns title
  end

  def contents
    # Returns contents
  end

  def count_words
    # Returns number of words in the contents as an Integer
  end

  def reading_time(wpm) # wpm = Integer representing the number of word the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes for the contents at the given wpm
  end

  def contacts
    # Returns list of contacts
  end

  def format_entry
    # Returns an array of the form  # ["my title, my contents, Contacts== Full Name: 07123456789"]
  end
end


class TodoList
  def initialize
    # tasks => list of all the tasks ([])
  end

  def add(task) # task = string representing an instruction
    # adds task to the list
    # Returns nothing
  end

  def all_tasks
    # Returns a list of the tasks addes as strings
  end
end


class ContactList
  def initialize
    # ...
  end

  def add(contact_details) # contact_details = instance of Contact
    # add contact details to empty list
  end

  def all
    # Returns list of all contacts
  end

  def format
    # Returns an array of the form ["Contacts== Full Name1: 07111222333, Full Name2: 07444555666"]
  end
end

class Contact
  def initialize(name, number) # name and number are both strings
    #..
  end

  def name
    # Gets name
  end

  def number
    # Gets number
  end

  def format
    # Returns a string of the form  "Full Name: mobile number"
  end
end




```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
diary = Diary.new
diary_entry = DiaryEntry.new
todo_list = TodoList.new
contact = Contact.new
contact_list = ContactList.new

DIARY
# Gets all information
diary = Diary.new
diary_entry1 = DiaryEntry.new(title, contents, contacts)
diary_entry1 = DiaryEntry.new(title, contents, contacts)
diary_entry1 = DiaryEntry.new(title, contents, contacts)
diary.add_entry(diary_entry1)
diary.add_entry(diary_entry2)
diary.add_entry(diary_entry3)
diary.count_words # => 8
diary.reading_time(2) # => 4
diary.find_best_entry_for_reading_time(2, 1) # => diary_entry1
todo_list = TodoList.new
diary.add_tasks(todo_list)
diary.format_diary # => [[diary_entry1], [diary_entry2], [diary_entry3], todolist]


DIARY ENTRY
# Gets entry contents and contact details and formats the entry
diary_entry = DiaryEntry.new(title, contents, contacts)
diary_entry.title # => "my title"
diary_entry.contents # => "my contents"
diary_entry.count_words # => 2
diary_entry.reading_time(2) # => 1
contact_list = ContactList.new
diary_entry.contacts # => "Full Name: 07111222333"
diary_entry.contacts # => "Full Name: 07444555666"
diary_entry.format_entry # => ["my title, my contents, Contacts== Full Name: 07111222333, Full Name: 07444555666"]


CONTACT LIST
# Gets all contacts
contact_list = ContactList.new
contact = Contact.new(name, number)
contact_list.add(contact1)
contact_list.add(contact2)
contact_list.all # => [contact1, contact2]
contact_list.format # => [Contacts== Full Name: 07111222333, Full Name: 07444555666"]

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
DIARY
# Starts off with an empty list of entries
diary = Diary.new
diary.all # => []

# with no word count
diary = Diary.new
diary.count_words # => 0

# and no reading time
diary = Diary.new
diary.reading_time(2) # => 0

# and a readable entry of nil
diary = Diary.new
diary.find_best_entry_for_reading_time(2, 1) # => nil


DIARY ENTRY
# Constructs a diary entry
diary_entry = DiaryEntry.new(title, contents, contacts)
diary_entry.format_entry # => ["my title, my contents, Contacts: Full Name: 07111222333"]

# with a word cound method
diary_entry = DiaryEntry.new(title, contents, contacts)
diary_entry.count_words # => 2

# and a reading time method
diary_entry = DiaryEntry.new(title, contents, contacts)
diary_entry.reading_time(2) # => 1



TODO LIST
# Construct a todo list
todo_list = TodoList.new
todo_list.add(task1)
todo_list.add(task2)
todo_list.all_tasks # => ["Clean the house", "Wash the car"]


CONTACT
# Constructs a contact
contact = Contact.new(name, number)
contact.name # => "Full Name"
contact.number # => "07123456789"
contact.format # => "Full Name: 07123456789"


CONTACT LIST
# Starts off with an empty list of contacts
contact_list = ContactList.new
contact_list.all # => []

# adds formatted contacts to the list
contact_list = ContactList.new
contact = Contact.new(name, number)
contact_details = contact_list.add(contact)
contact_details # => ["Full Name: 07123456789"]
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
