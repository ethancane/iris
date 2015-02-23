require 'rails_helper'

RSpec.describe PublicChartsController do
  describe 'GET show' do
    login_user

    let(:chart_id) do
      %w[
        public-data
        value-based-purchasing
        outcome-of-care
        mortality
        pneumonia-mortality
      ].join('/')
    end

    save_fixture 'for_public-data' do
      get :show, id: 'public-data'
    end

    specify do
      get :show, id: chart_id
      expect(response).to be_success
    end
  end
end
