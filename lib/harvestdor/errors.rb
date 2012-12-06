# encoding: utf-8

module Harvestdor
  module Errors
    MissingPurlPage = Class.new(StandardError) 
    MissingContentMetadata = Class.new(StandardError) 
    MissingIdentityMetadata = Class.new(StandardError) 
    MissingRightsMetadata = Class.new(StandardError) 
    MissingDC = Class.new(StandardError) 
    MissingRDF = Class.new(StandardError) 
  end
end