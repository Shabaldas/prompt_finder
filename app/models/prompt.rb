# frozen_string_literal: true

class Prompt < ApplicationRecord
  searchkick highlight: [:text]

  def search_data
    {
      text:
    }
  end
end
