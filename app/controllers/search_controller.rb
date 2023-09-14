# frozen_string_literal: true

class SearchController < ApplicationController
  def search
    collection = Prompt.pagy_search(params[:query], highlight: { tag: '<strong style="background-color: yellow">' })
    @pagy, @results = pagy_searchkick(collection, items: 10)
  end
end
