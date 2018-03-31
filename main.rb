
text = File.read('words.txt')
filter = File.read('filter_words.txt')

WORDS_ONLY_REGEX = /[^\p{Alpha}']/i
SPACE_ONLY_REGEX = /\s+/

text_clean = text.gsub(WORDS_ONLY_REGEX, ' ').gsub(SPACE_ONLY_REGEX, ' ').to_s

puts '-'*20, 'Text Cleaned (only words), size: ', text_clean.size
puts text_clean

words_occurrences = text_clean.scan(/\w+/).reduce(Hash.new(0)){|res,w| res[w.downcase]+=1;res}.sort.to_h

puts '-'*20, 'Words Occurrences before filter, size: ', words_occurrences.size
puts words_occurrences

filtered_words ||= words_occurrences.reject do |word| filter.include?(word)
end

puts '-'*20, 'Words Occurrences after filter, size: ', filtered_words.size
puts filtered_words

most_used_words = Hash[filtered_words.sort_by { |k,v| -v }[0..19]]

puts '-'*20, 'The Most used words, size: ', most_used_words.size
puts most_used_words
