# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a user
> So that I can keep track of my tasks
> I want to check if a text includes the string #TODO.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby
task_tracker(text)

# text is a string with words in it
# task_tracker returns true if it includes the keyword #TODO
# task_tracker will be true as long as text includes 'TODO' with the # symbol
# #TODO can be uppercase or lowercase


```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# 1
task_tracker("")
# => fail "Not a task!"

# 2
task_tracker("#TODO Washing up")
# => true

# 3
task_tracker("#todo Washing up")
# => true

# 4
task_tracker("#TO DO Washing up")
# => false

# 5
task_tracker("#to do Washing up")
# => false

# 6
task_tracker("Washing up")
# => false

# 7
task_tracker("TODO Washing up")
# => false

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
