class ApikeysController < ApplicationController
    
    before_action :require_login
    before_action :require_admin, only: [:admin]
    
    def show_app
        @app = Application.find_by_id(params[:id])
    end
    
    def new_app
        @app = Application.new
    end
    
    
    def create
        
        @app = Application.new(app_params)
        if @app.save
            @current_user.applications << @app
            redirect_to apikey_path, notice: "Application saved"
        else
            render :action=>'new'
        end
    end
    
    def app_params
     params.require(:application).permit(:user_id,:name,:key)
    end
    
    def show
        @user = current_user
    end
    
    def destroy
        @app = Application.find_by_id(params[:id]).destroy
    
            redirect_to apikeyadmin_path, notice: "App deleted"

    end
    
    def admin
        @users = User.all
        #TODO RENDER VIEW FOR ADMIN PAGE
    end
    
    
     # Returns true if the user is logged in, false otherwise.
    def require_login
        unless logged_in?
          redirect_to root_path 
        end
    end
    
    # Returns the current logged-in user (if any).
    def current_user
        @current_user ||= User.find_by(id: session[:userid])
    end
    
    # Returns true if the user is logged in, false otherwise.
    def logged_in?
        !current_user.nil?
    end
    
    # Returns true if the user is logged in as admin, false otherwise.
    def admin?
         #warning: ADMIN must have id 0, rake db:seed to get admin and sample user
        logged_in? && current_user.id ===0
    end
    
    #
    def require_admin
        unless admin?
          redirect_to apikey_path
        end
    end
    
end
