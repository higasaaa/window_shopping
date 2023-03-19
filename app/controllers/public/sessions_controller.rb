class Public::SessionsController < Devise::SessionsController

 #ゲストログイン用
  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    flash[:notice] = 'ゲストユーザーとしてログインしました。'
    redirect_to root_path
  end

  protected

  def reject_user
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == false)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_customer_registration_path
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end
  
end
