class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /ingredients
  # GET /ingredients.json
  def index
    @ingredients = Ingredient.all
  end

  # GET /ingredients/1
  # GET /ingredients/1.json
  def show
  end

  # GET /ingredients/new
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients
  # POST /ingredients.json
  def create

      # add empty ingredient associated with @recipe
      @ingredient = Ingredient.new(ingredient_params)
      @ingredient.recipe_id = params[:ingredient][:recipe_id]
      @recipe = Recipe.find(params[:ingredient][:recipe_id])
      if @ingredient.save
        @recipe = @ingredient.recipe
        redirect_to edit_recipe_path(@recipe.id)
      else
        flash.notice = "Try Again"
      end

 end


  # PATCH/PUT /ingredients/1
  # PATCH/PUT /ingredients/1.json
  def update

      @ingredient.update(ingredient_params)
      @recipe = Recipe.find(params[:ingredient][:recipe_id])

      redirect_to edit_recipe_path(@recipe.id)



  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    @recipe = @ingredient.recipe

     respond_to do |format|
      @ingredient.destroy
      format.html { redirect_to edit_recipe_path(@recipe.id) }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end


    # flash[:notice] = "Successfully deleted ingredient."
    # redirect_to edit_recipe_path(@recipe.id)

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :quantity, :recipe)
    end
end
