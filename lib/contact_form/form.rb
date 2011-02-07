require 'mail_form'

module ContactForm
  class Form < ::MailForm::Base
    include ActionView::Helpers::TranslationHelper

    attribute :email, :validate => /[^@]+@[^\.]+\.[\w\.\-]+/, :allow_blank => true
    attribute :message, :validate => true
    attribute :nickname, :captcha => true

    def headers
      {
        :subject => t("contact_form.headers.subject"),
        :to => t("contact_form.headers.to"),
        :from => "#{from_header}"
      }
    end

    private

    def from_header
      email.blank? ? t('contact_form.headers.from') : email
    end
  end
end
