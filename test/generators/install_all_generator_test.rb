require "test_helper"
require 'generators/contact_form/install_all_generator'

class InstallAllGeneratorTest < Rails::Generators::TestCase
  tests ContactForm::Generators::InstallAllGenerator
  destination File.expand_path("../../tmp", __FILE__)

  setup do
    prepare_destination
    copy_routes
  end

  test "route generation" do
    run_generator
    assert_file 'config/routes.rb', %r(get "contact", :to => 'contact_form/contact#new', :as => 'new_contact_form')
    assert_file 'config/routes.rb', %r(post 'contact', :to => 'contact_form/contact#create', :as => 'contact_form')
  end

  test "model generation" do
    run_generator
    assert_file 'lib/contact_form/form.rb' do |form_model|
      assert_instance_method :headers, form_model
    end
    assert_no_file 'lib/contact_form.rb'
  end

  test "app generation" do
    run_generator
    assert_file 'app/controllers/contact_form/contact_controller.rb'
    assert_file 'app/views/contact_form/contact/new.html.haml'
  end

  test "config generation" do
    run_generator
    assert_file 'config/locales/contact_form.en.yml'
    assert_file 'config/initializers/contact_form.rb'
  end

  test "skip model generation" do
    run_generator ['--skip-model']
    assert_no_file 'lib/contact_form/form.rb'
  end

  test "skip app generation" do
    run_generator ['--no-app']
    assert_no_file 'app/controllers/contact_form/contact_controller.rb'
    assert_no_file 'app/views/contact_form/contact/new.html.haml'
  end

  test "skip config generation" do
    run_generator ['--no-config']
    assert_no_file 'config/locales/contact_form.en.yml'
    assert_no_file 'config/initializers/contact_form.rb'
  end

  def copy_routes
    routes = File.expand_path("../../../spec/dummy/config/routes.rb", __FILE__)
    destination = File.join(destination_root, "config")

    FileUtils.mkdir_p(destination)
    FileUtils.cp routes, destination
  end
end