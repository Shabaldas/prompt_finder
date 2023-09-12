# frozen_string_literal: true
require 'csv'

module DataProducer
  class CsvExport
    attr_reader :file

    def initialize(file:)
      @file = file
    end

    def call
      csv.each do |row|
        Prompt.find_or_create_by(text: row.first)
      end
    end

    private

    def utf8_file
      @utf8_file ||= file.force_encoding("UTF-8")
    end

    def csv
      @csv ||= CSV.parse(utf8_file, headers: false)
    end
  end
end
