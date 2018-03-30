require 'json'

class WordsOccurrencesPreprocessing
  WORDS_ONLY_REGEX = /[^\p{Alpha}']/i
  SPACE_ONLY_REGEX = /\s+/
  def self.to_words(text)
    text.gsub(WORDS_ONLY_REGEX, ' ').gsub(SPACE_ONLY_REGEX, ' ')
  end
end

class WordsOccurrencesAnalyser
  def initialize(text, filter)
    @words = words_occurrences.reject do |word| filter.include?(word)
    end
    @occurrences = 
    @filter = filter
  end

  def last_words(number_words)
    Hash[@words.sort_by { |k,v| -v }[0..number_words]]
  end

  def words_count
    @words.size
  end

  def highest_occurring_words
    
  end

  def longest_words
      words.inject({}) do |result, word|
      result[word] = word.length
      result
    end.group_by { |key, value| value }.max_by { |key, value| key }.last
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

def highest_ranking(entries)
  # Takes a hashmap of the form {"foo" => 100, "bar" => 45} and returns an array
  # containing the entries (array-ified) with the highest number as a value.
  entries.group_by{|word, occs| occs}.sort.last.last
end