# frozen_string_literal: true

class Prompt < ApplicationRecord
  extend Pagy::Searchkick
  searchkick highlight: [:text], special_characters: true

  def search_data
    {
      text: text
    }
  end
end
# ½