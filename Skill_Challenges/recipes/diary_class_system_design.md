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
┌───────────────────────────────┐
│ Diary                         │
│                               │
│ - add(entry)                  │
│ - add(task)                   │
│ - all                         │
│ - count_words                 │
│ - reading_speed(wpm, minutes) │
│ - best_entry_for_reading_time │
│   => [readable entries...]    │
└┬──────────┬───────────────────┘
 │          │                 
 │          │ owns a list of  
 │          ▼                 
 │        ┌───────────────────────┐ 
 │        │ DiaryEntry(title,     │ 
 │        │            contents)  │ 
 │        │ - title               │ 
 │        │ - contents            │ 
 │        │ - count_words         │ 
 │        │ - reading_time        │ 
 │        └───────────────────────┘ 
 │                            │
 ▼                            │
┌─────────────────────────┐   │
│ TodoList                │   │
│                         │   │
│ - add(task)             │   │
│ - complete/done?        │   │
│ - all                   │   │ 
│   => [tasks.....]       │   │
└─────────────────────────┘   │
                              │
                              │
                              ▼
    ┌─────────────────────────────┐          ┌─────────────────────────────┐
    │ ContactList                 │          │ Contact(name, number)       │
    │                             │          │                             │
    │ - add(contact_details)      │          │ - name                      │
    │ - all                       │--------->│ - number                    │
    │  => [list of contacts....]  │          │ - format                    │
    │                             │          │   => "Name: mobile number"  │
    └─────────────────────────────┘          └─────────────────────────────┘

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

  def add_task(tasks) # tasks is an instance of TodoList
    # tasks gets added to the diary
    # Returns nothing
  end

  def all
    # Returns a list of entry objects
    # Returns list of tasks
  end
end

class DiaryEntry
  def initialize(title, contents) # title and contents are both strings
    # ...
  end

  def title
    # Returns title
  end

  def contents
    # Returns contents
  end

  def count_words
    # Returns the number of words in the contents as an integer
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
  end

  def add_contacts(contact_list) # contact_list is an instance of ContactList
    # contact_list gets added to the diary entry
    # Returns list of contacts
  end

  def format_entry
    # Returns a string of the form     # ["my title.
                                       #  my contents.
                                       #  Contacts:
                                       #  Full Name: 07123456789"]
    
    
  end
end



class TodoList
  def initialize
    # ...tasks => list of all the tasks ([])
  end

  def add(task) # task is a string representing an instruction
    # add task to list of tasks
    # No return value
  end

  def all_tasks
    # Returns a list of the tasks added as strings
  end

  def complete(task) # task is a string representing a task to mark as complete
    # Marks qualifying tasks as done
    # Fails if the task doesn't complete
  end

end



class ContactList
  def initialize
    # ...
  end

  def add(contact_details)# contact_details is an instance of Contact
    # Returns name
  end

  def all
    # Returns list of all contacts
  end
end


class Contact
  def initialize(name, number) # title and artist are both strings
    # ...
  end

  def name
    # Returns name
  end

  def number
    # Returns number
  end

  def format
    # Returns a string of the form "Full Name: mobile number"
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

# 1 Gets all information
diary = Diary.new
diary_entry1 = DiaryEntry.new("my title", "my contents")
diary_entry2 = DiaryEntry.new("my title 2", "my contents 2")
diary_entry3 = DiaryEntry.new("my title 3", "my contents 3")
diary.add_entry(diary_entry1)
diary.add_entry(diary_entry2)
diary.add_entry(diary_entry3)
todo_list = TodoList.new
diary.add_tasks(todo_list)
diary.all # =>  [[diary_entry1], [diary_entry2], [diary_entry3], [todo_list]]
diary.count_words # =>   8
diary.reading_time(2) # =>   4
diary.find_best_entry_for_reading_time(2, 1) # =>  diary_entry1

# Gets entry contents and contact details
diary_entry = DiaryEntry.new("my title", "my contents")
contacts = Contacts.new
diary_entry.title # =>  "my title"
diary_entry.contents # =>  "my contents"
diary_entry.count_words # =>  2
diary_entry.reading_time(2) # =>  1
diary_entry.add_contacts # =>  ["Full Name1: 07123456789", "Full Name2: 07123456789", "Full Name3: 07123456789"]


```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# Contructs a diary entry
diary_entry = DiaryEntry.new("my title", "my contents")
diary_entry.format_entry # =>   [ "my title;    my contents;    Contacts: Full Name: 07123456789" ]
 
# Construct a to do list
todo_list = TodoList.new
todo_list.add("Clean the house")
todo_list.add("Wash the car")
todo_list.all_tasks # =>  ["Clean the house", "Wash the car"]
todo_list.complete # =>  ["Clean the house :_done", "Wash the car :_done"]


# Contstructs a contact
contact = Contact.new("Full Name", "07123456789")
contact.format # =>  "Full Name: 07123456789"

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
