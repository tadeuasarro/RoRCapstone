require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:test_user) { User.create(username: 'Tadeu', full_name: 'Tadeu Sarro') }
  let(:subject) { described_class.new(text: 'This is the text.', author_id: test_user.id) }

  describe 'validations' do
    it 'is valid for everything is valid' do
      expect(subject).to be_valid
    end
    it "is invalid for the author_id doesn't exist" do
      subject.author_id = 3
      expect(subject).not_to be_valid
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
