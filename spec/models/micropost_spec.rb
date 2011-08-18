require 'spec_helper'

describe Micropost do
  
  before(:each) do
    @user = Factory(:user)
    @attr = { :content => "lorum ipsum"}
  end
  
  it "should create a new instance with valid attributes" do
    @user.microposts.create!(@attr)
  end
  
  describe "user associations" do
    
    before(:each) do
      @microposts = @user.microposts.create(@attr)
    end
    
    it "should have a user attribute" do
      @microposts.should respond_to(:user)
    end
    
    it "should have the right associated user" do
      @microposts.user_id == @user.id
      @microposts.user.should == @user
    end
  end
end
