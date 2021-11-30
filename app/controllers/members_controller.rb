class MembersController < ApplicationController
  before_action :authenticate_client!
  before_action :authenticate_user!, except: [:new, :create]
  
  def show
    puts "params: #{params}"
    render json: { message: "If you see this, you're in!" } and return
  end
end