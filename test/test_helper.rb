ENV["RAILS_ENV"] = "test"

require File.expand_path("../../spec/dummy/config/environment.rb",  __FILE__)
require 'rails/test_help'
require 'rails/generators/test_case'

Rails.backtrace_cleaner.remove_silencers!
