require 'spec_helper'

describe "Sending a contact email" do
  context "I'm on the contact page" do
    before { visit new_contact_form_url }

    it "I should see an input for email" do
      page.should have_selector "input#contact_form_form_email"
    end

    it "I should see a textarea for message" do
      page.should have_selector "textarea#contact_form_form_message"
    end

    it "I should see a submit button" do
      page.should have_selector "input#contact_form_form_submit"
    end

    it "The nickname field should be hidden" do
      page.should have_no_selector "input#contact_form_form_nickname", :visible => true
    end

    context "Submitting a form" do
      after { ActionMailer::Base.deliveries = [] }

      context "Submitting a valid form" do
        before do
          fill_in 'Email', :with => 'a@example.com'
          fill_in 'Message', :with => 'howdy'
          click_button 'Submit'
        end

        it "I should be on the contact page again" do
          current_url.should == new_contact_form_url
        end

        it "An email should have been sent" do
          ActionMailer::Base.deliveries.size.should == 1
        end

        it "The email should have the correct attributes" do
          mail = ActionMailer::Base.deliveries.last
          mail.to.should == ['arailsdemo@example.com']
          mail.from.should == ['a@example.com']
          mail.body.should match 'howdy'
        end
      end

      context "Submitting an invalid form" do
        context "Nickname submitted" do
          before do
            fill_in 'Email', :with => 'a@example.com'
            fill_in 'Message', :with => 'asdf'
            fill_in 'Nickname', :with => 'robot'
            click_button 'Submit'
          end

          it "I should be at the contact form page" do
            current_url.should == new_contact_form_url
          end

          it "An email should not have been sent" do
            ActionMailer::Base.deliveries.size.should == 0
          end
        end

        context "Email and message are invalid" do
          before do
            fill_in 'Email', :with => 'a'
            fill_in 'Message', :with => ''
            click_button 'Submit'
          end

          it "I should be at the contact form page" do
            current_url.should == new_contact_form_url
          end

          it "I should see two error messages" do
            page.should have_content 'Email is invalid'
            page.should have_content "Message can't be blank"
          end
        end
      end
    end
  end
end
