
# This class clean the text file give to it, live only the text.
class WordsOccurrencesPreprocessing
  # Match any character that is not in the set: Alphabetic characters	\p{Alpha} in Java syntax. /i = case insensitive
  WORDS_ONLY_REGEX = /[^\p{Alpha}']/i
  # \s = Matches any whitespace character (space, tabs, line breaks). + = Match 1 or more of the preceding token.
  SPACE_ONLY_REGEX = /\s+/
  # substitute the sets and create a new text file cleaned
  def self.to_words(text)
    text.gsub(WORDS_ONLY_REGEX, ' ').gsub(SPACE_ONLY_REGEX, ' ')
  end
end