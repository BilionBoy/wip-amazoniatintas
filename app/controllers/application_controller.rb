class ApplicationController < ActionController::Base
  before_action :authenticate_user! # Autentica o usuário antes de qualquer ação
  include Pagy::Backend # Inclui Pagy para uso no Backend

  # Definir o layout de acordo com o controller
  # before_action :set_layout_by_controller


  layout :set_layout_by_controller

  private

  def set_layout_by_controller
    if devise_controller?
      "devise_application"
    elsif controller_path == "store" || controller_path.start_with?("store/")
      "home_application"
    else
      "application"
    end
  end
end
