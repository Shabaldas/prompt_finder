# frozen_string_literal: true

RSpec.describe DataProducer::CsvExport, type: :service do
  describe '.call' do
    let(:file_path) { "./spec/fixtures/dummy.csv" }
    let(:file) { File.read(file_path) }
    let(:instance) { described_class.new(file: file) }

    it 'creates 10 records from CSV data without duplicats' do
      expect {
        instance.call
      }.to change(Prompt, :count).by(5)
      
      # second call
      expect { instance.call }.to change(Prompt, :count).by(0)
    end
  end
end
