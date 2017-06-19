class PurchasesController < ApplicationController
  def create
    @shoe=Shoe.find(params[:id])
    @purchase=Purchase.create(user:current_user,shoe: @shoe )
    redirect_to user_path(current_user)

  end
end
