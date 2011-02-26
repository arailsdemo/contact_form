require "test_helper"
require 'generators/contact_form/install_generator'

class InstallGeneratorTest < Rails::Generators::TestCase
  tests ContactForm::Generators::InstallGenerator
  destination File.expand_path("../../tmp", __FILE__)

  setup :prepare_destination
  teardown :remove_temp_files

  test 'all files are properly created' do
    run_generator
    assert_file 'config/locales/contact_form.en.yml',
                /Thanks for the message!/
    assert_file 'config/initializers/contact_form.rb'
  end

  def remove_temp_files
    rm_rf destination_root
  end
end
