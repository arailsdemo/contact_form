require 'haml-rails'
require 'simple_form'

module ContactForm
  class ContactController < ::ApplicationController
    before_filter :_before_filter

    def new
      @form = ContactForm::Form.new(:email => _email)
      respond_to do |format|
        format.html
        format.js { render :layout => false }
      end
    end

    def create
      @form = ContactForm::Form.new(params[:contact_form_form])

      if @form.deliver
        redirect_to "#{send t('contact_form.redirect_url')}", :notice => t("contact_form.success")
      else
        render :new
      end
    end

    private

    def _before_filter
      instance_eval &ContactForm.before_filter
    end

    def _email
      instance_eval &ContactForm.form_email
    end
  end
end
