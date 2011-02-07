require "spec_helper"

describe ContactForm::ContactController do

  def mock_form(stubs={})
    @mock_form ||= mock_model(ContactForm::Form, stubs).as_null_object
  end

  context "GET new" do
    before { ContactForm::Form.stub(:new) { mock_form } }

    it "assigns @form" do
      get :new
      assigns(:form).should be mock_form
    end

    it "renders the form if format = js" do
      get :new, :format =>:js
      response.should render_template "contact_form/contact/new"
    end
  end

  context "POST create" do
    context "with valid params" do
      before do
        ContactForm::Form.stub(:new).with({'these' => 'params'}) { mock_form(:deliver => true) }
        post :create, :contact_form_form => {'these' => 'params'}
      end

      it "assigns @form" do
        assigns(:form).should be mock_form
      end

      it "set the success flash" do
        controller.flash[:notice].should == 'Thanks for the message!'
      end

      it "redirects to the contact page" do
        response.should redirect_to new_contact_form_url
      end
    end

    context "with invalid params" do
      before do
        ContactForm::Form.stub(:new).with({'these' => 'params'}) { mock_form(:deliver => false) }
        post :create, :contact_form_form => {'these' => 'params'}
      end

      it "assigns @form" do
        assigns(:form).should be mock_form
      end

      it "re-renders the contact form" do
        response.should render_template 'new'
      end
    end
  end
end
