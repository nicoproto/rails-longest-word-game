require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
  end

  def home
  end

  def score
    @word = params[:word]
    url = 'https://wagon-dictionary.herokuapp.com/' + @word
    word_result = open(url).read
    word_json = JSON.parse(word_result)
    @grid = params[:grid].split(' ')

    @message = word_check(word_json, @grid, @word)[0]
    @score = word_check(word_json, @grid, @word)[1]

    if session[:current_score].nil?
      session[:current_score] = 0
    else
      session[:current_score] += @score
    end

    @current_score = session[:current_score]
  end

  def find_chars(subject, characters)
    letters = characters.chars
    subject.chars.each do |letter|
      i = letters.index(letter)
      next if i.nil?

      letters.delete_at(i)
      return true if letters.empty?
    end
    false
  end

  def word_check(word_json, grid, attempt)
    if word_json['found']
      if find_chars(grid.join, attempt.upcase)
        ['Well done!', word_json['length'].to_i**2]
      else
        ['You used letters that were not in the grid', 0]
      end
    else
      ["That's not an english word", 0]
    end
  end
end
