require 'rails_helper'
require './features/support/omni_auth_fixtures'

RSpec.describe User, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :first_name }
    it { is_expected.to have_db_column :last_name }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :role }
		it { is_expected.to have_db_column :encrypted_password }
		it { is_expected.to have_db_column :provider }
		it { is_expected.to have_db_column :uid }

  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
  end

  describe FactoryBot do
    it 'should have valid Factory' do
      expect(create(:user)).to be_valid
    end
	end
end
