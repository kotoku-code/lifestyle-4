require 'rails_helper'

RSpec.describe User, type: :model do


  describe 'associations' do
    it { should have_many(:links) }
    it { should have_many(:votes) }
    it { should have_many(:comments) }

  end

end
