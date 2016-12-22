class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
 def index
    if params[:search].present?
      @recipes =  Recipe.search_by_full_name(params[:search])
    else
    @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create

    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
      # save goes like usual
      if @recipe.save
        flash[:notice] = "Successfully created recipe."
        redirect_to edit_recipe_path(@recipe.id)
      else
        flash[:alert] = @recipe.errors.full_messages.first
        redirect_to new_recipe_path
      end

  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update

    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_params)
        flash.notice = "Updated Successfully"
      else
        flash.notice = @user.errors.full_messages.first
      end

    render :action => 'edit'
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "Successfully deleted recipe."
    redirect_to recipes_url
  end

  # def title_search
  #   @recipes =  Recipe.search_by_full_name(params[:search])
  # end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:title, :description, :serving, :preparation_time_hours, :preparation_time_minutes, :cooking_time_hours, :cooking_time_minutes, :avatar,:user_id)
    end
end
