ContactForm.before_filter do
  logged_in?
end

ContactForm.form_email do
  set_email
end