module V1

  class PalindromesController < ApplicationController
    @@palindromes = {}


    def index
      cleanup
      render json: @@palindromes.values.last(10)
    end

    def create ()
      cleanup
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

    # Disposes hash pairs that are older than 10 minutes
    def cleanup
      @@palindromes.each do |k, v|
        if k < (Time.now - 10.minutes)
          @@palindromes.delete(k)
        end
      end
    end

  end

end
