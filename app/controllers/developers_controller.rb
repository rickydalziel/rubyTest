class DevelopersController < ApplicationController
    
    before_action :get_developer, only: [:show, :delete, :edit, :update, :destroy]
    http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]
    
    def index
        @developers = Developer.all
    end   
    
    def new 
        @developer = Developer.new
    end
    
    def create
        @developer = Developer.new(developer_params)
        @developer.formed = Time.new
        if (@developer.save)
            redirect_to @developer
        else
            render 'new'
        end
    end
    
    def update 
        if(@developer.update(developer_params))
            redirect_to @developer
        else
            render 'edit'
        end
    end   
    
    def destroy
        @developer.destroy
        redirect_to games_path
    end
    
    private
    def developer_params
        params.require(:developer).permit(:name)
    end
    
    private
    def get_developer
        @developer = Developer.find(params[:id])
    end
end
