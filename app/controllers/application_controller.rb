class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :fetch_collections_with_id, only: [:new, :create, :edit, :update], if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birthday, :gender_id, :schooling_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :birthday, :gender_id, :schooling_id])
  end

  def fetch_collections_with_id
    @genders = Gender.all.map { |g| [g.name, g.id] }
    @schoolings = Schooling.all.map { |s| [s.name, s.id] }
  end

end
