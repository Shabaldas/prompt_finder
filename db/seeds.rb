# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

csv_file_path = '/lib/train.csv'

path = 'app/lib/train.csv'
csv_file_content = File.read(path)
csv_export = DataProducer::CsvExport.new(file: csv_file_content).call