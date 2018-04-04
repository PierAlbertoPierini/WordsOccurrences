require 'json'

class WordsAnalyser
  def initialize(text, filter)
    @words = text
    @filter = filter
  end

  def highest_occurring_words(number_words)
    Hash[filtered_words.sort_by { |k,v| -v }[0..number_words]].to_s
  end

  def words_occurrences
    filtered_words.scan(/\w+/).reduce(Hash.new(0)){|res,w| res[w.downcase]+=1;res}.sort.to_h
  end

  def text_list
    list = word_occurrences.sort_by {|word, occs| occs}.reverse.map do |word, occs|
      "  #{word}: #{occs}"
    end.join("\n")
    "\n" + list + "\n"
  end

  def html_list
    list = word_occurrences.sort_by {|word, occs| occs}.reverse.map do |word, occs|
      "  <li>#{word}: #{occs}</li>"
    end.join("\n")
    "<ul>\n" + list + "\n</ul>"
  end

  def json_list
    JSON.parse(word.to_json)
  end
end

private

def filtered_words
    @filtered_words ||= @words.reject do |word| @filter.include?(word)
end
end
