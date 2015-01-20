#!/usr/bin/env ruby

require "./word"

class Joviality
  attr_accessor :top_score
  attr_accessor :words

  def initialize(file=nil)
    if file
      process(file)
    end
  end

  def process(file)
    @words = []
    string = file.read
    string.split(" ").each do |string|
      @words << Word.new(string)
    end
    top_score
  end

  def top_score
    @top_score ||= @words.sort_by{|w| w.score }.reverse.first.score
  end

  def top_words
    @words.select{ |w| w.score == @top_score }.map(&:string)
  end
end

joviality = Joviality.new(File.open("alastalon_salissa.txt", "r"))
puts "\nAlastalon salissa -romaanin hassuimmat sanat ovat: \n"
joviality.top_words.each do |word|
  puts "- #{word}"
end
puts "\nSanojen hassuuspisteet ovat #{joviality.top_score}.\n"