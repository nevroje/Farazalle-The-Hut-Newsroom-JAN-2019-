class ApplicationController < ActionController::Base
  before_action :set_locale

	def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
	end

	def after_sign_in_path_for(resource)
		if current_user.editor?
			staff_content_editor_articles_path
		elsif current_user.journalist?
			staff_content_journalist_articles_path
		else
				root_path
		end
	end
end
