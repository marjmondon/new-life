class LivesController < ApplicationController
  def index
    @lives = policy_scope(Life)
  end

  def create
    @life = Life.new(life_params)
    # The user of the life to create is the current user
    @life.user = current_user
    authorize @life
  end

  def new
    @life = Life.new
    authorize @life
  end

  def show
    authorize @life
  end

  def edit
    authorize @life
  end

  def update
    authorize @life
  end

  def destroy
    authorize @life
  end

  private

  def life_params
    params.require(:life).permit(:title, :description, :price )
  end
end
