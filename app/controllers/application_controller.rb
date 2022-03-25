class ApplicationController < ActionController::Base
    # viewでも使えるようにする
    helper_method :current_user 
    
    def login?
        if current_user.nil?
            redirect_to login_path,alert:"※ログインして下さい"
        end
    end
    
    def already_login?
        unless current_user.nil?
            redirect_to patients_path,notice:"※ログインしています"
        end
    end    
        
    def current_user
        if session[:user_id]
            current_user ||=User.find(session[:user_id])
        end
            
    end
    
    
    
    
    
end
