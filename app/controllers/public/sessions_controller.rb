# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

 #ゲストログイン用
  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    flash[:notice] = 'ゲストユーザーとしてログインしました。'
    redirect_to root_path
  end

  protected

  #退会済みの会員がログインできないようにする
  #顧客が退会しているか判断するメソッド
  #処理1 入力されたemailからアカウントを1件取得
  #取得できなかった場合、このメソッドを終了する
  #処理2 取得したアカウントのパスワードと入力されたパスワードが一致しているかを判断
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



  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
