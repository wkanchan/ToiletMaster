# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#

require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:name) }             # there's name column
  it { should respond_to(:email) }            # there's email column
  it { should respond_to(:password_digest) }  # there's password_digest column
  it { should respond_to(:password) }         # require the presence of password
  it { should respond_to(:password_confirmation) }  # and match with pwd conf
  it { should respond_to(:remember_token) }   # for session remember
  it { should respond_to(:authenticate) }     # for user authentication "method"
  it { should respond_to(:reviews) }          # for reviews of this user

  # with "subject { @user }", this block is analogous to calling @user.valid?
  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  # don't want user to enter blank password/conf
  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  # check too short password (< 6) by testing that password "aaaaa" shouldn't be valid
  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  # ???
  describe "return value of authenticate method" do
    # save @user to retrieve it later to check
    before { @user.save }
    # let :found_user be the user with this email
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      # check whether or not this password is valid for :found_user
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      # let :user_for_invalid_password be "false"
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end

  describe "remember token" do
    before { @user.save }
    # this is equivalent to "it { @user.remember_token.should_not be_blank }"
    its(:remember_token) { should_not be_blank }
  end

  describe "review associations" do

    before { @user.save }
    let!(:older_review) do
      FactoryGirl.create(:review, user: @user, created_at: 1.day.ago, toilet_id:1, clean:10)
    end
    let!(:newer_review) do
      FactoryGirl.create(:review, user: @user, created_at: 1.hour.ago, toilet_id:1, clean:10)
    end

    it "should have the right review in the right order" do
      @user.reviews.should == [newer_review, older_review]
    end

    it "should destroy associated reviews" do
      reviews = @user.reviews
      @user.destroy
      reviews.each do |review|
        Review.find_by_id(review.id).should be_nil
      end
    end
  end

end
