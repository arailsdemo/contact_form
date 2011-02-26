module ContactForm
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc <<-CONTENT
  Adds a ContactFrom initializer and locale files to your app.

  In the initalizer file, you can set a before filter for the\
 ContactController. Also, you can set the email value to be\
 used when when creating a new ContactForm::Form in the\
 controller.

  In the locale file, you can set various string values such as\
 the ContactForm::Form title.

  CONTENT

      def copy_initializer
        template "contact_form.rb", "config/initializers/contact_form.rb"
      end

      def copy_locale
        copy_file "../../../config/locales/en.yml", 'config/locales/contact_form.en.yml'
      end
    end
  end
end
