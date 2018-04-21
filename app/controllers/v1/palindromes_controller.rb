module V1

  class PalindromesController < ApplicationController
    @@palindromes = []


    def index
      render json: @@palindromes.last(10)
    end

    def create
      phrase = params[:phrase]
      clean = phrase.gsub(/[^A-Za-z.]/, '').downcase
      if clean == clean.reverse
        @@palindromes.push(phrase)
        render json: true
      else
        render json: false
      end
    end

  end

end
