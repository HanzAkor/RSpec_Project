def make_snippet(string)
  string1 = string.split[0..4].join(' ')
  return "#{string1} ..."
end