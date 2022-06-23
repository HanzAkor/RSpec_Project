# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a user

> So that I can improve my grammar

> I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby
is_correct = check_grammar(text)

# * text is a string with words in it
# * is_correct is a boolean depending on whether it checks out


```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# 1
check_grammar("")
# => fail "Not a sentence."

# 2
check_grammar("Hello I am Hannah.")
# => true

# 3
check_grammar("Hello I am Hannah")
# => false

# 4
check_grammar("hello I am Hannah.")
# => false

# 4.5
check_grammar("hello, I am Hannah")
# => fail

# 5
check_grammar("HELLO, I am Hannah.")
# => true

# 6
check_grammar("Hello, I am Hannah!")
# => true

# 7
check_grammar("Hello, I am Hannah?")
# => true

# 8
check_grammar("Hello, I am Hannah,")
# => false


```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
