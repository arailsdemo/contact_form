module ContactForm
  module Generators
    class InstallAllGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../", __FILE__)
      class_option :app,    :type => :boolean, :default => true,
                            :desc => 'Generate controller and view.'
      class_option :model,  :type => :boolean, :default => true,
                            :desc => 'Generate the Form model.'
      class_option :config, :type => :boolean, :default => true,
                            :desc => 'Generate config files.'

      desc <<-CONTENT
  This will install ContactForm's model, controller, view,\
 locale and initializer files. Also, it adds the two ContactForm\
 routes to your routes.rb file.

  CONTENT

      def add_contact_form_routes
        contact_form_routes = %(get "contact", :to => 'contact_form/contact#new', :as => 'new_contact_form'\n)
        contact_form_routes << %(  post 'contact', :to => 'contact_form/contact#create', :as => 'contact_form'\n)
        route contact_form_routes
      end

      def copy_app
        directory('app', 'app') if options.app?
      end

      def copy_model
        if options.model?
          copy_file 'lib/contact_form/form.rb', 'lib/contact_form/form.rb'
        end
      end

      def copy_config
        invoke 'contact_form:install' if options.config?
      end
    end
  end
end
