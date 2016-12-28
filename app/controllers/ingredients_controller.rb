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


      @recipe = Recipe.find(params[:ingredient][:recipe_id])


      respond_to do |format|
      @ingredient.update(ingredient_params)
      format.html { redirect_to edit_recipe_path(@recipe.id) }
      format.json { head :no_content }
      format.js   { @notice = "Successfully Updated Ingredient" }
    end


  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    @recipe = @ingredient.recipe
      @ingredient.destroy

      redirect_to edit_recipe_path(@recipe.id)



    flash[:notice] = "Successfully deleted ingredient."
    # redirect_to edit_recipe_path(@recipe.id)

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :quantity, :recipe_id)
    end
end
