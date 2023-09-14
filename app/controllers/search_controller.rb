# frozen_string_literal: true

class SearchController < ApplicationController
  def search
    @results = Prompt.search(params[:query], highlight: { tag: '<strong style="background-color: yellow">' }, page: params[:page], per_page: 20)

    respond_to do |format|
      format.html { render "home/index" }
      format.turbo_stream
    end
  end
end
