# CsvJsonConverter

<a name="readme-top"></a>
# :green_book: Table of Contents
[![csv_json_ - converter](https://img.shields.io/badge/json__or__ruby__to__-csv-2ea44f)](https://rubygems.org/gems/csv_json_converter)
- [:green_book: Table of Contents](#-table-of-contents)
- [:book: csv\_json\_converter ](#-csv_json_converter-)
  - [Installation ](#installation-)
    - [Usage](#usage)
      - [Using to\_json](#csv_to_json)
      - [Using activerecord\_to\_csv](#using-activerecord_to_csv)
      - [json\_or\_ruby\_to\_csv usage with rails controller](#json_or_ruby_to_csv-usage-with-rails-controller)
  - [:busts_in_silhouette: Authors ](#-authors-)
  - [:handshake: Contributing ](#-contributing-)
  - [:star:️ Show your support ](#️-show-your-support-)
# :book: csv_json_convert <a name="about-project"></a>
This gem converts a csv string to json object.
## Installation <a name="tech-stack"></a>
Add the following code to you Gemfile
```
gem 'csv_json_converter'
```
or
install the gem on your terminal
```
gem install csv_json_converter
```
### Usage
`require` this gem on the top of your ruby code.
#### Covert csv_to_json
If you want to convert `csv string`, to json you can use `to_json` method from `CsvJsonConverter`. Let's see how:-

<i>For example </i>
```ruby

    require 'csv_json_converter'

    data_csv='file;text;number;hex
              test18.csv;CMkABfAGXvmSFV;9892576;jz40cbafbec8d6f92e93d22ea6ef5b'

    json_data = CsvJsonCoverter.to_json(data_csv)

    print json_data
   
```

**The output looks like below**
```
    { "file": "test18.csv",
      "text": "CMkABfAGXvmSFV",
      "number": 9892576,
      "hex": "jz40cbafbec8d6f92e93d22ea6ef5b"
    }
```

## :busts_in_silhouette: Authors <a name="authors"></a>
 :bust_in_silhouette: Pablo Zambrano
- GitHub: [@alexoid1](https://github.com/melashu)
- Twitter: [@pablo_acz](https://twitter.com/meshu102)
- LinkedIn: [Pablo Alexis Zambrano](https://www.linkedin.com/in/alexzambranocoral/)
## :handshake: Contributing <a name="contributing"></a>
This repo is open for contributions. Issues, and feature requests are welcome!
Feel free to check the [issues page.](https://github.com/melashu/csv_json_converter/issues)
## :star:️ Show your support <a name="support"></a>
Give a star if you like this project!
<p align="right">(<a href="#readme-top">back to top</a>)</p>



