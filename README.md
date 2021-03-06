# Harvestdor
[![Build Status](https://travis-ci.org/sul-dlss/harvestdor.svg?branch=master)](https://travis-ci.org/sul-dlss/harvestdor)
[![Code Climate Test Coverage](https://codeclimate.com/github/sul-dlss/harvestdor/badges/coverage.svg)](https://codeclimate.com/github/sul-dlss/harvestdor/coverage)
[![Gem Version](https://badge.fury.io/rb/harvestdor.svg)](https://badge.fury.io/rb/harvestdor)

A Gem to harvest data from a Stanford Purl page, with convenience methods for
getting Nokogiri::XML::Document and errors when pieces are missing

## Installation

Add this line to your application's Gemfile:

    gem 'harvestdor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install harvestdor

## Usage

### Configuration

#### Possible configuration options (with default values unless otherwise indicated)

  client = Harvestdor::Client.new({ # Example with all possible options
    :log_dir => File.join(File.dirname(__FILE__), "..", "logs"),
    :log_name => 'harvestdor.log',
    :purl => 'https://purl.stanford.edu'
 })

#### Option 1:  use a yaml file

for contents of yml --  see spec/config/example.yml

  client = Harvestdor::Client.new({:config_yml_path => path_to_my_yml})
  client.mods('oo111oo2222')

#### Option 2:  pass in non-default configurations as a hash

  client = Harvestdor::Client.new({:purl => 'https://my_purl.org'})
  client.mods('oo111oo2222')

#### Option 3:  set the attributes explicitly in your code

  client = Harvestdor::Client.new
  client.config.purl = 'https://my_purl.org'
  client.mods('oo111oo2222')


### XML from PURL pages

You can get, for example, the contentMetadata for a druid:

  it "#content_metadata retrieves contentMetadata as a Nokogiri::XML::Document" do
    cm = Harvestdor.content_metadata('bb375wb8869', 'https://purl-test.stanford.edu')
    cm.should be_kind_of(Nokogiri::XML::Document)
    cm.root.name.should == 'contentMetadata'
    cm.root.attributes['objectId'].text.should == @druid
  end

Or the MODS metadata:

  it "#mods returns a Nokogiri::XML::Document from the purl mods" do
    x = Harvestdor.mods('bb375wb8869', 'https://purl-test.stanford.edu')
    x.should be_kind_of(Nokogiri::XML::Document)
    x.root.name.should == 'mods'
    x.root.namespace.href.should == Harvestdor::MODS_NAMESPACE
  end

Similarly for
- mods
- public_xml  (all of it)
- content_metadata
- identity_metadata
- rights_metadata
- rdf
- dc

You can also do this from a Harvestdor::Client object, and it will use the purl from the Client.config:

  client = Harvestdor::Client.new({purl: 'https://thisone.org'})
  client.identity_metadata('bb375wb8869')


## Contributing

- Fork it
- Create your feature branch (`git checkout -b my-new-feature`)
- Write code and tests.
- Commit your changes (`git commit -am 'Added some feature'`)
- Push to the branch (`git push origin my-new-feature`)
- Create new Pull Request

## Releases

* <b>0.0.14</b> Bug fix for compatibility with jruby
* <b>0.0.13</b> Updated to work with Faraday 0.9, releases via rubygems instead of sul-gems
* <b>0.0.11</b> better error handling, and better testing for errors
* <b>0.0.10</b> tweak specs to test that unnec fetching isn't done.
* <b>0.0.9</b> allows public xml to be passed as Nokogiri::XML::Document to content_metadata, etc. to avoid unnec fetching
* <b>0.0.8</b> avoid undefined method 'size' from scrub_oai_args when using a non-nil default date param
* <b>0.0.7</b> add oai client timeout overrides, update README
* <b>0.0.6</b> refactoring oai_harvest for greater simplicity and passing errors through, add oai_record (get_record OAI request)
* <b>0.0.5</b> don't send empty string arguments to OAI server so you can get actual results
* <b>0.0.4</b> add integration spec and get it working with actual OAI server
* <b>0.0.3</b> add method to get mods from purl
* <b>0.0.2</b> tidy up README
* <b>0.0.1</b> initial commit
