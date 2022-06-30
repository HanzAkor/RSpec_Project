# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a user
> So that I can keep track of my music listening
> I want to add tracks I've listened to and see a list of them

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby
class TracksList
  def initialize
    # list of all the tracks

  end

  def add(track) # track == string representing a musical track
    # add track to list of tracks
    # no return value
  end

  def list
    # returns list of the tracks added as strings
  end

end


```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# 1
tracks_list = TracksList.new
tracks_list.list # => []

# 2
tracks_list = TracksList.new
tracks_list.add("Light of the Seven")
tracks_list.list # => ["Light of the Seven"]

# 3
tracks_list = TracksList.new
tracks_list.add("Light of the Seven")
tracks_list.add("The Night King")
tracks_list.list # => ["Light of the Seven", "The Night King"]

# 4
tracks_list = TracksList.new
tracks_list.add("")
tracks_list.add # => fail "Enter track title."

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
