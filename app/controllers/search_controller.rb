# frozen_string_literal: true

class SearchController < ApplicationController
  def search
    @results = Prompt.search(params[:query], highlight: { tag: '<strong style="background-color: yellow">' })
  end
end
