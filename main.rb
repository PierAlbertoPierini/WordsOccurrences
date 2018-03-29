
text = File.read('words.txt')
filter = File.read('filter_words.txt')

words_occurrences = text.scan(/\w+/).reduce(Hash.new(0)){|res,w| res[w.downcase]+=1;res}.sort.to_h
#words_occurrences_cleaned = text.scan(/[^\p{Alpha}']/i).reduce(Hash.new(0)){|res,w| res[w.downcase]+=1;res}.sort.to_h

filtered_words ||= words_occurrences.reject do |word| filter.include?(word)
end

sorted_words_by_value = filtered_words.sort_by {|_key, value| value}.to_h

reverted = filtered_words.keys.sort[0,10].each do |key|
end
 
longest_words = filtered_words.inject({}) do |result, word|
      result[word] = word.length
      result
    end.group_by { |key, value| value }.max_by { |key, value| key }.last

puts "-"*20
puts words_occurrences
#puts "-"*20, 'words_occurrences_cleaned'
#puts words_occurrences_cleaned
puts "-"*20
puts words_occurrences.length
puts "-"*20
puts filtered_words
puts "-"*20
puts filtered_words.length
puts "-"*20
puts filtered_words.size
puts "-"*20
puts sorted_words_by_value
puts "-"*20
puts reverted
puts "-"*20
puts filtered_words.group_by { |key, value| value }.max_by { |key, value| key }.last
puts "-"*20
puts longest_words
puts "-"*20
WORDS_ONLY_REGEX = /[^\p{Alpha}']/i
SPACE_ONLY_REGEX = /\s+/

text_clean = text.gsub(WORDS_ONLY_REGEX, ' ').gsub(SPACE_ONLY_REGEX, ' ')

puts text_clean
puts "-"*20
puts text_clean.size

text_clean_words = text_clean.scan(/\w+/).reduce(Hash.new(0)){|res,w| res[w.downcase]+=1;res}.sort.to_h
puts "-"*20
puts text_clean_words
puts "-"*20
puts text_clean_words.size
puts "-"*20
last_five = Hash[text_clean_words.sort_by { |k,v| -v }[0..4]]
puts last_five