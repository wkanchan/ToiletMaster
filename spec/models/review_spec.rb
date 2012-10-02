# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  toilet_id  :integer
#  clean      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  content    :string(255)
#

require 'spec_helper'

describe Review do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is wrong! Because anyone can send a review with fake user_id
    # @review = Review.new(content: "Lorem ipsum", user_id: user.id, toilet_id: 1, clean: 10)
    @review = user.reviews.build(content: "Super clean", toilet_id: 1, clean: 10 )
  end

  subject { @review }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Review.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when user_id is not present" do
    before { @review.user_id = nil }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @review.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @review.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @review.content = "a" * 141 }
    it { should_not be_valid }
  end

  describe "with too much cleanliness score" do
    before { @review.clean = 11 }
    it { should_not be_valid }
  end

end
