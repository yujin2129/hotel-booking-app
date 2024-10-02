class SearchesController < ApplicationController
  def search
    @word = params[:word]
    @address_word = params[:address_word]

    @rooms = Room.search_for(@word, @address_word)
  end
end
