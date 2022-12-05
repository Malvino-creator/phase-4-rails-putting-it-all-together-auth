class RecipesController < ApplicationController
    before_action :authorize
    def index
        recipe = Recipe.all
        render json: recipe
    end

    def create
        user = User.find_by(id: session[:user_id])
        recipe = user.recipes.create!(term)
        render json: recipe, status: :created
    end
    private
    def term
        params.permit(:title, :instructions, :minutes_to_complete)
    end
end
