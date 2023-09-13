# frozen_string_literal: true

RSpec.describe DataProducer::CsvExport, type: :service do
  describe '.call' do
    let(:file_path) { './spec/fixtures/dummy.csv' }
    let(:file) { File.read(file_path) }
    let(:instance) { described_class.new(file:) }

    it 'creates 10 records from CSV data without duplicats' do
      expect do
        instance.call
      end.to change(Prompt, :count).by(5)

      # second call
      expect { instance.call }.not_to change(Prompt, :count)
    end
  end
end
