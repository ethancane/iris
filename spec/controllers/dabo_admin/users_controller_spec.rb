require 'rails_helper'

RSpec.describe DaboAdmin::UsersController do
  login(:dabo_admin)

  let(:invalid_attributes) { { is_dabo_admin: nil } }

  it_behaves_like 'an ApplicationController'
  it_behaves_like 'an ApplicationController index'
  it_behaves_like 'an ApplicationController new'
  it_behaves_like 'an ApplicationController create'
  it_behaves_like 'an ApplicationController edit'
  it_behaves_like 'an ApplicationController update' do
    let(:new_attributes) { { is_dabo_admin: true } }
  end

  it_behaves_like 'an ApplicationController show'
  it_behaves_like 'an ApplicationController delete'

  it_behaves_like 'a Dabo Admin page'

  describe 'PUT update with an empty password' do
    let(:admin_user) { FactoryGirl.create(:dabo_admin) }
    let(:attributes) { { password: '' } }
    let!(:encrypted_password) { admin_user.encrypted_password }

    before do
      put :update, id: admin_user, user: attributes
    end

    it 'maintains the old one' do
      expect(admin_user.reload.encrypted_password).to eq encrypted_password
    end
  end
end
