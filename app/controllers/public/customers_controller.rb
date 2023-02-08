class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
  end

  def update
  end

  def confirm
  end

  def withdrawal
  end
  
  
  private
    def customer_params
      params.require(:customer).permit(:nickname, :email, :birthdate, :live_area)
    end
end
