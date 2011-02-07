module ContactForm
  class ContactController < ApplicationController
    def new
      @form = ContactForm::Form.new
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
  end
end
