RSpec.shared_examples 'a Dabo Admin page' do
  controller do
    def custom
      render nothing: true
    end
  end

  before do
    this_controller = controller
    routes.draw do
      get 'custom' => "#{this_controller.controller_path}#custom"
    end
    get :custom
  end

  context 'with a Dabo Admin logged in' do
    login(:dabo_admin)
    it { expect(response).to be_success }
  end

  context 'with a normal user logged in' do
    login(:user)
    it { is_expected.to redirect_to('/') }
  end
end
