require 'rails_helper'

RSpec.describe Following, type: :model do
  let(:test_follower) { User.create(username: 'Tadeu', full_name: 'Tadeu Sarro') }
  let(:test_followed) { User.create(username: 'Maria', full_name: 'Maria Sarro') }
  let(:subject) { described_class.new(follower_id: test_follower.id, followed_id: test_followed.id) }

  describe 'validations' do
    it 'is valid, because both users actually exist' do
      expect(subject).to be_valid
    end
    it "is invalid, because the follower doesn't exist" do
      subject.followed_id = -1
      expect(subject).not_to be_valid
    end
    it "is invalid, because the followed doesn't exist" do
      subject.follower_id = -1
      expect(subject).not_to be_valid
    end
  end

  describe 'relations' do
    it { is_expected.to belong_to(:follower) }
    it { is_expected.to belong_to(:followed) }
  end
end
