module Importer
  class Moviefile
    require 'csv'

    def self.csv_importer(file)
      CSV.foreach(file, headers: true) do |row|
        row = row.to_hash
        title =row["﻿DVD_Title"]
        date = row['Released'] ? row['Released'] : row['DVD_ReleaseDate']
        studio = row['Studio']
        price = row['Price']
        genre = row['Genre']
        Movie.create!(title: title, date: Date.strptime(date,"%m/%d/%y"), studio: studio, price: price, genre: genre)
      end
    end
  end
end        