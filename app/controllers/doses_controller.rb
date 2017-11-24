class DosesController < ApplicationController
  def index
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new
    @dose.cocktail = @cocktail
    if @dose.save
      # <Dose id: 1, cocktail_id: 1, ingredient_id: 6, description: "1/4">
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  # def show
  # end

  def destroy
    dose = Dose.find(params[:id])
    dose.destroy

    redirect_to cocktail_path(dose.cocktail)
  end

  # def edit
  # end

  # def update
  # end

  private

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
