require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end

  describe User do

	  before do
		  @user = User.new(name: "Example User", email: "user@example.com",
		                   password: "foobar", password_confirmation: "foobar")
	  end

	  subject { @user }

	  it { should respond_to(:name) }
	  it { should respond_to(:email) }
	  it { should respond_to(:password_digest) }
	  it { should respond_to(:password) }
	  it { should respond_to(:password_confirmation) }

	  it { should be_valid }

  end

  describe "when password is not present" do
	  before do
		  @user = User.new(name: "Example User", email: "user@example.com",
		                   password: " ", password_confirmation: " ")
	  end
	  it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
	  before { @user.password_confirmation = "mismatch" }
	  it { should_not be_valid }
  end

  describe "return value of authenticate method" do
	  before { @user.save }
	  let(:found_user) { User.find_by(email: @user.email) }

	  describe "with valid password" do
		  it { should eq found_user.authenticate(@user.password) }
	  end

	  describe "with invalid password" do
		  let(:user_for_invalid_password) { found_user.authenticate("invalid") }

		  it { should_not eq user_for_invalid_password }
		  specify { expect(user_for_invalid_password).to be_false }
	  end
  end

end
