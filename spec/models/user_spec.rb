require 'rails_helper'

RSpec.describe User, type: :model do


  describe 'associations' do
    it { should have_many(:links) }
    it { should have_many(:votes) }
    it { should have_many(:comments) }

  end

  it 'fails validation with no email expecting a specific message' do
    no_email_user = User.new(email: '')
    no_email_user.valid?
    expect(no_email_user.errors[:email]).to include('can\'t be blank')
  end

end
