class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :fetch_collections_with_id, only: [:new, :create, :edit, :update], if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birthday, :gender_id, :schooling_id, :phone])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :birthday, :gender_id, :schooling_id, :phone])

    end
    layout :layout_by_resource
  
  def fetch_collections_with_id
    @genders = Gender.all.map { |g| [g.name, g.id] }
    @schoolings = Schooling.all.map { |s| [s.name, s.id] }
  end

  private
    def layout_by_resource
      if devise_controller?
        if request.fullpath.match?('/users')
          'login'
        else
          'application'
        end
      else
        'application'
      end
    end
end
