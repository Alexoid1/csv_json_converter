# frozen_string_literal: true
require 'csv_json_converter'

RSpec.describe CsvJsonConverter do

  

  it "has a version number" do
    expect(CsvJsonConverter::VERSION).not_to be nil
  end

  
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

  let(:jsonExample){ "[{\"file\":\"test18.csv\",\"text\":\"CMkABfAGXvmSFV\",\"number\":\"9892576\",\"hex\":\"jz40cbafbec8d6f92e93d22ea6ef5b\"},{\"file\":\"test18.csv\",\"text\":\"NCVTagVs\",\"number\":\"815097234\",\"hex\":\"jz0ee6f01d178831228b957376f15c\"},{\"file\":\"test18.csv\",\"text\":\"RCZgwkLosc\",\"number\":\"3\",\"hex\":\"jz22ff45479c30a890925d5832c319\"},{\"file\":\"test18.csv\",\"text\":\"HZgYgaBNZFXyVdzuRuddpg\",\"number\":\"31\",\"hex\":\"jz737707427673939e4c198598cefc\"},{\"file\":\"test18.csv\",\"text\":\"tfp\",\"number\":\"6\",\"hex\":\"jzedd110611f58b53215dd0b27f7ba\"}]"
}
  
  context 'covert csv to json' do

    it "Should be an Array" do
      
      expect(JSON.parse(CsvJsonConverter.to_json(csvExample))).to be_an_instance_of(Array) 
    end

    it "Should have the value of string" do
    
      expect(JSON.parse(CsvJsonConverter.to_json(csvExample))[0]["file"]).to eql("  test18.csv")
      
    end

    it "Should be a empty array when any data is passed" do

      expect(CsvJsonConverter.to_json(csvEmpty)).to eql("[]")
    end

    it "Should convert to json a csv with semicolon as separator" do

      expect(JSON.parse(CsvJsonConverter.to_json(csvExampleSep, ';'))[0]["file"]).to eql("  test18.csv")
      
    end

    it "Should convert to json a csv with || as separator" do

      expect(JSON.parse(CsvJsonConverter.to_json(csvExample2Sep, '||'))[0]["file"]).to eql("  test18.csv")
      
    end

  end

  context 'convert json to csv' do

    it "Should be a string" do
      expect(CsvJsonConverter.to_csv(jsonExample)).to be_an_instance_of(String) 
    end

    it "Should have headers in the string" do
      expect(CsvJsonConverter.to_csv(jsonExample)).to include('file,text,number,hex')
    end
  end  
end
