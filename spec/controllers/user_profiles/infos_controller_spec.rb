require 'rails_helper'

RSpec.describe UserProfiles::InfosController do
  login_user

  include_context 'an ApplicationController'
  it_behaves_like 'an ApplicationController show without a model'
end
