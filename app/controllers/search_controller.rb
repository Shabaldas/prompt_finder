# frozen_string_literal: true

class SearchController < ApplicationController
  def search
    @results = Prompt.search(params[:query], highlight: { tag: '<strong style="background-color: yellow">' }
    )
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('results', partial: 'home/search_results',
                                                            locals: { results: @results })
      end
    end
  end
end
