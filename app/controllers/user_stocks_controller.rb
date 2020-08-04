class UserStocksController < ApplicationController

  def create

    stock=Stock.check_db( params[:ticker] )

     if stock.blank?
      stock=Stock.look_up(params[:ticker])
      stock.save
    end

    @user_stock = UserStock.create(user: current_user,stock:stock)
    flash[:notice]="Stock #{stock.name} was successfully added to portfolio !"
    redirect_to my_portfolio_path

  end

  def destroy

    stock=Stock.find(params[:id])

    user_stock = UserStock.where( user_id: current_user.id,stock_id: stock.id).take

    user_stock.destroy

    flash[:notice]="#{stock.name} stock deleted successfully !"

    redirect_to my_portfolio_path
  end

end
