class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :fetch_collections_with_id, only: [:new, :create, :edit, :update], if: :devise_controller?

  protected

  layout :layout_by_resource

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birthday, :gender_id, :schooling_id, :phone, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :birthday, :gender_id, :schooling_id, :phone, :avatar])
  end

  def fetch_collections_with_id
    @genders = Gender.all.map { |g| [g.name, g.id] }
    @schoolings = Schooling.all.map { |s| [s.name, s.id] }
  end

  def layout_by_resource
    if devise_controller? && !request.fullpath.match?('/users/edit') && !(request.fullpath.match('/users') && params[:action] == 'update')
      'authenticate'
    else
      'application'
    end
  end

end
