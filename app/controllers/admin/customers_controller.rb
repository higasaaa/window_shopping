class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "顧客情報を更新しました。"
      redirect_to admin_path
    else
      render:edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:nickname, :email, :birthdate, :sex, :live_area, :is_deleted)
  end
end
