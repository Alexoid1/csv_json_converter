# frozen_string_literal: true
require "csv"
require "json"
require_relative "csv_json_converter/version"

module CsvJsonConverter
  class Error < StandardError; end
  # Your code goes here...
  def self.to_json(input, separator=',')
    for_csv = CSV.parse(input,:col_sep => separator,headers: true, header_converters: :symbol)
    # treat first row as headers if the caller didn't provide them
    arr_to_json = for_csv.map(&:to_h).to_json
          
    arr_to_json
    
      
  end
end
