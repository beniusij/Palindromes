module V1

  class PalindromesController < ApplicationController
    @@palindromes = {}


    def index
      render json: latest_palindromes
    end

    def create
      phrase = params[:phrase]
      clean = phrase.gsub(/[^A-Za-z]/, '').downcase
      if clean == clean.reverse
        @@palindromes[Time.now] = phrase
        render json: {result: true}
      else
        render json: {result: false}
      end
    end

    private

    def latest_palindromes
      p = []
      @@palindromes.each do |k, v|
        if k > (Time.now - 10.minutes)
          p.push(v)
        end
      end
      return p.last(10)
    end

  end

end
