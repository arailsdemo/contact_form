module ContactForm
  require 'contact_form/engine'
  autoload :Form, 'contact_form/form'

  def self.before_filter(&block)
    @filter = block if block
    @filter || Proc.new {}
  end

  def self.form_email
    @email = Proc.new if block_given?
    @email || Proc.new {}
  end
end
