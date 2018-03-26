require 'json'

class WordsAnalyser
  def initialize(text, filter)
    @words = text
    @filter = filter
  end

  def word_count
    filtered_words.size
  end

  def word_occurrences
    @word_occurrences = filtered_words.scan(/\w+/).reduce(Hash.new(0)){|res,w| res[w.downcase]+=1;res}
  end

  def highest_occurring_words
    word_occurrences.group_by { |key, value| value }.max_by { |key, value| key }.last #I would like to decide how many words I can show
  end

  def longest_words
    filtered_words.inject({}) do |result, word|
      result[word] = word.length
      result
    end.group_by { |key, value| value }.max_by { |key, value| key }.last  #I would like to decide how many words I can show
  end

  def html_list
    list = ""
    word_occurrences.sort_by { |key, value| value }.reverse.each do |key, value|
      list << "  <li>#{key}: #{value}</li>\n"
    end
    "<ul>\n" + list + "</ul>"
  end
  def json_list
    JSON.parse(word_occurrences.to_json)
  end

private

  def filtered_words
    @filtered_words ||= @words.delete(@filter) 
  end
end

