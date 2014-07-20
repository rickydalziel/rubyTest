class GamesController < ApplicationController

    before_action :get_game, only: [:show, :delete, :edit, :update, :destroy]
    http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]

    def index
        @games = Game.all
    end

    def new
        @game = Game.new
    end

    def create
        @game = Game.new(game_params)
        @game.released = Time.new
        if(@game.save)
            redirect_to @game
        else
            render 'new'
        end
    end

    def update
        if(@game.update(game_params))
            redirect_to @game
        else
            render 'edit'
        end
    end
    
    def destroy
        @game.destroy
        redirect_to games_path
    end


    private 
    def game_params
        params.require(:game).permit(:name, :description)
    end

    private 
    def get_game
        @developer = Developer.find(params[:developer_id])
        @game = @developer.games.find(params[:id])
    end

end
