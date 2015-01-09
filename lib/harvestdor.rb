require 'harvestdor/errors'
require 'harvestdor/purl_xml'
require 'harvestdor/version'
require 'harvestdor/client'
# external gems
require 'confstruct'
# stdlib
require 'logger'
require 'open-uri'
require 'yaml'

module Harvestdor
  
  LOG_NAME_DEFAULT = "harvestdor.log"
  LOG_DIR_DEFAULT = File.join(File.dirname(__FILE__), "..", "logs")
  PURL_DEFAULT = 'http://purl.stanford.edu'
  HTTP_OPTIONS_DEFAULT = { 'ssl' => { 
    'verify' => false 
  }, 
  'request' => {
    'timeout' => 60, # open/read timeout (seconds)
    'open_timeout' => 60 # connection open timeout (seconds)
  }
}
end # module Harvestdor