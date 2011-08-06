require 'spec_helper'

describe "Users" do
  
  describe "signup" do
    
    describe "failure" do
      it "should not make a new user" do
        lambda do
          visit signup_path
          fill_in "Name", :with =>""
          fill_in "Email", :with =>""
          fill_in "Password", :with =>""
          fill_in "Retype Password", :with =>""
          click_button
          response.should render_template('users/new')
          response.should have_selector('div#error_explanation')
        end.should_not change(User, :count)
      end
    end
    
    describe "success" do
      
      before(:each) do
        @attr = { :name => "New User", :email => "user@example.com", :password => "foobar", :password_confirmation => "foobar"}
      end
      
      it "should make a new user" do
        lambda do
          visit signup_path
          fill_in "Name", :with => "#{@attr[:name]}"
          fill_in "Email", :with => "#{@attr[:email]}"
          fill_in "Password", :with => "#{@attr[:password]}"
          fill_in "Retype Password", :with => "#{@attr[:password_confirmation]}"
          click_button
          response.should have_selector('div.flash.success', :content => "Welcome")
          response.should render_template('users/show')
        end.should change(User, :count).by(1)
      end
    end
    
  end
end
