def task_tracker(text)
  fail "Not a task!" if text.empty?

  if text.include?("#TODO") || text.include?("#todo")
    return true
  else
    return false
  end

end