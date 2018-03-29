require 'json'

class WordsOccurrences
  def initialize(text, filter)
    @words = text
    @filter = filter
  end

  def word_occurrences
    
  end

  def word_count
    filtered_words.size
  end

  def highest_occurring_words
    Hash[text_clean_words.sort_by { |k,v| -v }[0..4]]
  end

  def longest_words
    filtered_words.inject({}) do |result, word|
      result[word] = word.length
      result
    end.group_by { |key, value| value }.max_by { |key, value| key }.last  #I would like to decide how many words I can show
  end

#  def html_list
#    list = ""
#    word_occurrences.sort_by { |key, value| value }.reverse.each do |key, value|
#      list << "  <li>#{key}: #{value}</li>\n"
#    end
#    "<ul>\n" + list + "</ul>"
#  end
#  def json_list
#    JSON.parse(word_occurrences.to_json)
#  end

private

  def filtered_words
    @filtered_words ||= @words #.delete(@filter) 
  end
end

