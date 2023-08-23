# frozen_string_literal: true
require 'csv_json_converter'

RSpec.describe CsvJsonConverter do

  let(:csvExample){ 'file,text,number,hex
  test18.csv,ERPL
  test18.csv,CMkABfAGXvmSFV,9892576,jz40cbafbec8d6f92e93d22ea6ef5b
  test18.csv,NCVTagVs,815097234,jz0ee6f01d178831228b957376f15c
  test18.csv,RCZgwkLosc,3,jz22ff45479c30a890925d5832c319
  test18.csv,HZgYgaBNZFXyVdzuRuddpg,31,jz737707427673939e4c198598cefc
  test18.csv,tfp,6,jzedd110611f58b53215dd0b27f7ba
  '}

  let(:csvExampleSep){ 'file;text;number;hex
  test18.csv;ERPL
  test18.csv;CMkABfAGXvmSFV;9892576;jz40cbafbec8d6f92e93d22ea6ef5b
  test18.csv;NCVTagVs;815097234;jz0ee6f01d178831228b957376f15c
  test18.csv;RCZgwkLosc;3;jz22ff45479c30a890925d5832c319
  test18.csv;HZgYgaBNZFXyVdzuRuddpg;31;jz737707427673939e4c198598cefc
  '}

  let(:csvExample2Sep){ 'file||text||number||hex
  test18.csv||ERPL
  test18.csv||CMkABfAGXvmSFV||9892576||jz40cbafbec8d6f92e93d22ea6ef5b
  test18.csv||NCVTagVs||815097234||jz0ee6f01d178831228b957376f15c
  test18.csv||RCZgwkLosc||3||jz22ff45479c30a890925d5832c319
  test18.csv||HZgYgaBNZFXyVdzuRuddpg||31||jz737707427673939e4c198598cefc
  '}

  let(:csvEmpty){ 'file,text,number,hex' }

  it "has a version number" do
    expect(CsvJsonConverter::VERSION).not_to be nil
  end

  it "Should be an Array" do
    
    expect(JSON.parse(CsvJsonConverter::CsvParse.parse(csvExample, true))).to be_an_instance_of(Array) 
  end

  it "Should have the value of string" do
   
    expect(JSON.parse(CsvJsonConverter::CsvParse.parse(csvExample, true))[0]["file"]).to eql("  test18.csv")
    
  end

  it "Should be a empty array when any data is passed" do

    expect(CsvJsonConverter::CsvParse.parse(csvEmpty, true)).to eql("[]")
  end

  it "Should convert to json a csv with semicolon as separator" do

    expect(JSON.parse(CsvJsonConverter::CsvParse.parse(csvExampleSep, true, ';'))[0]["file"]).to eql("  test18.csv")
    
  end

  it "Should convert to json a csv with || as separator" do

    expect(JSON.parse(CsvJsonConverter::CsvParse.parse(csvExample2Sep, true, '||'))[0]["file"]).to eql("  test18.csv")
    
  end
end
