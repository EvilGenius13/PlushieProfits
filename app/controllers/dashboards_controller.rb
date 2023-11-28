class DashboardsController < ApplicationController
  include Secured
  before_action :create_or_update_user

  def show
    @auth_info = session[:userinfo]
    # puts @auth_info['sub']
    @user = User.find_by(auth_id: @auth_info['sub'])
    @factory = @user.factory if @user.present?
  end

  private

  def create_or_update_user
    auth_id = session[:userinfo]['sub']
    user = User.find_or_initialize_by(auth_id: auth_id)

    if user.new_record?
      user.username = generate_random_username
      user.balance = 500
      user.save!
    end

  end

  def generate_random_username
    loop do
      random_username = rand(10**13).to_s.rjust(13, '0')
      return random_username unless User.exists?(username: random_username)
    end
  end
end
