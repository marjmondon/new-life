class LivesController < ApplicationController
  def create
    @life = Life.new(life_params)
    # The user of the life to create is the current user
    @life.user = current_user
    # [...]
  end

  def life_params
    params.require(:life).permit(:title, :description, :price )
  end
end
