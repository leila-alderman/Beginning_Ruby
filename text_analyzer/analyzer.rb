# Text Analyzer: shows various statistics about a text file that is selected in the command line
# To run this code, in the command line, type
# ruby analyzer.rb <filename>

# Create an array of stop words to determine how interesting the text is (http://en.wikipedia.org/wiki/Stop_words)
stopwords = %w{the a by on for of are with just but and to the my I has some in}

# Read in the text and create a string
lines = File.readlines(ARGV[0])
line_count = lines.size
text = lines.join

# Count the characters, words, sentences, and paragraphs
total_characters = text.length
characters_no_spaces = text.gsub(/\s+/, "").length
word_count = text.split.length
sentence_count = text.split(/[\.\?!]/).length
paragraph_count = text.split(/\n\n/).length

# Calculate the percentage of non-stop words
all_words = text.scan(/\w+/)
good_words = all_words.reject{ |word| stopwords.include?(word) }
good_word_perc = ((good_words.length.to_f / all_words.length.to_f) * 100).to_i

# Create a summary 
sentences = text.gsub(/\s+/, " ").strip.split(/[\.\?!]/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)

# Show the analysis
puts "Lines: #{line_count}"
puts "Character count: #{total_characters}"
puts "Character count (excluding spaces): #{characters_no_spaces}"
puts "Word count: #{word_count}"
puts "Sentence count: #{sentence_count}"
puts "Paragraph count: #{paragraph_count}"
puts "Average number of words per sentence: #{word_count/sentence_count}"
puts "Average number of sentences per paragraph: #{sentence_count/paragraph_count}"
puts "Percentage of non-fluff words: #{good_word_perc}%"
puts "Text summary: "
puts ideal_sentences.join(". ")