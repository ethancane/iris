# A controller for Hospital Systems Admin Panel
class DaboAdmin::HospitalSystemsController < ApplicationController
  private

  def model_params
    params.require(:hospital_system).permit(:name)
  end
end
