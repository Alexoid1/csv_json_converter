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

  def self.to_csv(input)
    
    for_json=JSON.parse(input)
    column_names = for_json.first.keys
    csv_string=CSV.generate do |csv|
      csv << column_names
      for_json.each do |x|
        csv << x.values
      end
    end

    csv_string

  end
end


arr_json=CsvJsonConverter.to_json('file,text,number,hex
test18.csv,CMkABfAGXvmSFV,9892576,jz40cbafbec8d6f92e93d22ea6ef5b
test18.csv,NCVTagVs,815097234,jz0ee6f01d178831228b957376f15c
test18.csv,RCZgwkLosc,3,jz22ff45479c30a890925d5832c319
test18.csv,HZgYgaBNZFXyVdzuRuddpg,31,jz737707427673939e4c198598cefc
test18.csv,tfp,6,jzedd110611f58b53215dd0b27f7ba
')

arr_csv=CsvJsonConverter.to_csv(
  arr_json
)

p arr_csv

