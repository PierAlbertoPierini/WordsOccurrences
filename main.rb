require_relative 'words_occurrences.rb'

text = File.read('words.txt')
filter = File.read('filter_words.txt')
analyser = WordsAnalyser.new(text, filter)

puts "Word count after filtering is: #{analyser.word_count}"
puts "\n"

puts "The most frequent words are:"
#WordsAnalyser.highest_occurring_words.each do |key, value|
#  puts "  - #{key}: #{value} occurences"
#end
puts "\n"

puts "The longest words are:"
#WordsAnalyser.longest_words.each do |word|
#  puts "  - #{word.first}: #{word.last} characters"
#end
puts "\n"

puts "Word list:"
#puts WordsAnalyser.html_list


puts "JSON object:"
#puts WordsAnalyser.json_list

puts WordsAnalyser.word_occurrences
