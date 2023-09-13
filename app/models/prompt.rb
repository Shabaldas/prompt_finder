# frozen_string_literal: true

class Prompt < ApplicationRecord
  extend Pagy::Searchkick
  
  searchkick highlight: [:text]

  def search_data
    {
      text:
    }
  end
end
# ½