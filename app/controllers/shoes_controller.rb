class ShoesController < ApplicationController

  def new
    @shoe=Shoe.new

  end
  def index
    @shoes=Shoe.all
    @purchases=Purchase.all
    @user=User.find(session[:user_id])
    @all_purchases_ids=Purchase.pluck(:shoe_id)
  end

  def create
    @user=User.find(session[:user_id])
    @shoe=Shoe.create(shoe_params.merge(user:@user))
    redirect_to :back
  end

  def destroy
    Shoe.find(params[:id]).destroy
    redirect_to :back

  end

  private
    def shoe_params
      params.require(:shoe).permit(:product, :amount)
    end
end
