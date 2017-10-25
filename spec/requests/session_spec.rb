require 'spec_helper'
include Warden::Test::Helpers

RSpec.describe "Sessions" do
  
  before(:each) { Warden.test_mode! }
  after(:each) { Warden.test_reset! }

  let(:user) { @user ||= User.create!(email: "user@example.com", password: "asdf7890") }


  def scope(resource)
    resource.class.name.underscore.to_sym
  end


  it "signs user in" do

    login_as(user, scope: scope(user))
    get authenticated_root_path
    expect(controller.current_user).to eq(user)
    
  end

end