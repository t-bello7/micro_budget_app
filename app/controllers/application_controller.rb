class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        categories_path
    end
end
