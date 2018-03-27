
text = File.read('words.txt')
filter = File.read('filter_words.txt')

words_occurrences = text.scan(/\w+/).reduce(Hash.new(0)){|res,w| res[w.downcase]+=1;res}.sort.to_h

filtered_words ||= words_occurrences.reject do |word| filter.include?(word)
end

sorted_words_by_value = filtered_words.sort_by {|_key, value| value}.to_h

reverted = filtered_words.keys.sort[0,10].each do |key|
end
 

puts "-"*20
puts words_occurrences
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