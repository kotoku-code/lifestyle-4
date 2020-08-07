require 'rails_helper'

RSpec.describe Comment, type: :model do

    subject(:comment) { Comment.new(body: 'Capos') }

    describe 'validations' do
        it { should validate_presence_of(:body) }
      end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:link) }

  end

end