class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_guest_customer, only: [:edit, :update]

  def favorite
    @customer = current_customer
  end

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "登録情報を更新しました。"
      redirect_to customers_path
    else
      render :edit
    end
  end

  def confirm
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を完了いたしました。"
    redirect_to root_path
  end


  private
    def customer_params
      params.require(:customer).permit(:nickname, :email, :birthdate, :live_area)
    end

    def ensure_guest_customer
      if current_customer.email == "guest@example.com"
        flash[:notice] = "ゲストユーザーはプロフィール編集画面へ遷移できません"
        redirect_to customers_path
      end
    end
end
