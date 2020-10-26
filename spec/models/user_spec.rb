require 'rails_helper'

RSpec.describe User, type: :model do
  let(:subject) do
    described_class.new(
      username: 'Tadeu',
      full_name: 'Tadeu Sarro',
      photo: 'https://photo.url.com',
      cover_image: 'https://coverimage.url.com'
    )
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.not_to validate_presence_of(:photo) }
    it { is_expected.not_to validate_presence_of(:cover_image) }

    it "expects the subject to me invalid for it doesn't have an username" do
      subject.username = ''
      expect(subject).not_to be_valid
    end
    it "expects the subject to me invalid for it doesn't have a full_name" do
      subject.full_name = ''
      expect(subject).not_to be_valid
    end
    it "expects the subject to me valid for it doesn't have a photo" do
      subject.photo = ''
      expect(subject).to be_valid
    end
    it "expects the subject to me invalid for it doesn't have a cover_image" do
      subject.cover_image = ''
      expect(subject).to be_valid
    end

    it "expects the subject to me invalid for it's username doesn't match the length requirements" do
      subject.username = 'Me'
      expect(subject).not_to be_valid
    end
    it "expects the subject to me invalid for it's username doesn't have a cover_image" do
      subject.username = 'This is some ridiculously long string, because we need it to be.'
      expect(subject).not_to be_valid
    end

    it "expects the subject to me invalid for it's full_name doesn't match the length requirements" do
      subject.full_name = 'Me'
      expect(subject).not_to be_valid
    end
    it "expects the subject to me invalid for it's full_name doesn't have a cover_image" do
      subject.full_name = 'This is some ridiculously long string, because we need it to be.'
      expect(subject).not_to be_valid
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:follower_relations) }
    it { is_expected.to have_many(:followed_relations) }
  end
end
