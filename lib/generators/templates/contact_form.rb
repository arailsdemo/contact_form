# Setup your before_filter for ContactController here
ContactForm.before_filter do
#  unless logged_in?
#   session[:redirect_after_login] =
#     {
#       :url => new_contact_form_url,
#       :message => 'Thanks for logging in.'
#     }
#   redirect_to login_path, :notice => 'Please login first in order to contact us.'
#  end
end

# Setup the default email value for ContactController#new
ContactForm.form_email do
#  session[:email]
end
