require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    @count = @analyzed_text.count_of_words
    @vowel = @analyzed_text.count_of_vowels
    @consonant = @analyzed_text.count_of_consonants
    @letter = @analyzed_text.most_used_letter
    
    erb :results
  end
end
