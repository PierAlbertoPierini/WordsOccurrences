#!/usr/bin/env ruby -wKU

# Debug File


require_relative 'words_analyser.rb'
require_relative 'words_preprocessing.rb'

text = WordsPreprocessing.to_words(File.read('words.txt'))
filter = WordsPreprocessing.to_words(File.read('filter_words.txt'))
analyser = WordsAnalyser.new(text, filter)

#puts analyser.highest_occurring_words(5)
#puts analyser.words_occurrences
puts @words
