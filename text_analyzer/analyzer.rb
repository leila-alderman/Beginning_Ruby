lines = File.readlines("text.txt")
line_count = lines.size
text = lines.join
total_characters = text.length
characters_no_spaces = text.gsub(/\s+/, "").length
word_count = text.split.length
sentence_count = text.split(/[\.\?!]/).length
paragraph_count = text.split(/\n\n/).length

puts "Lines: #{line_count}"
puts "Character count: #{total_characters}"
puts "Character count (excluding spaces): #{characters_no_spaces}"
puts "Word count: #{word_count}"
puts "Sentence count: #{sentence_count}"
puts "Paragraph count: #{paragraph_count}"
puts "Average number of words per sentence: #{word_count/sentence_count}"
puts "Average number of sentences per paragraph: #{sentence_count/paragraph_count}"