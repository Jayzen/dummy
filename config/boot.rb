# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../../Gemfile', __dir__)

require 'bootsnap/setup'
$LOAD_PATH.unshift File.expand_path('../../../lib', __dir__)
