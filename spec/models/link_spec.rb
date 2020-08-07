require 'rails_helper'

RSpec.describe Link, type: :model do

    subject(:link) { Link.new(title: 'Capos', url: 'https://startbootstrap.com/snippets/') }

    describe 'validations' do
        it { should validate_presence_of(:title) }

      end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:votes) }

  end

end