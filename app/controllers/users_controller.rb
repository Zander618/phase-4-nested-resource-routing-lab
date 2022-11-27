class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def show
    user = User.find_by(id: params[:id])
    render json: user, include: :items
  end

  def index_user_items
    user = User.find(params[:user_id])
    user_items = user.items
    render json: user_items
  end 

  def items
    user = User.find(params[:user_id])
    user_items = user.items
    items = user_items.find(params[:id])
    render json: items
  end

  def create
    user = User.find(params[:user_id])
    user_items = user.items
    item = user_items.create(item_params)
    render json: item, status: :created
  end

  # /users/:user_id/items

  private
  
  def item_params
    params.permit(:name, :description, :price)
  end

  def render_not_found_response
    render json: { error: "Dog house not found" }, status: :not_found
  end

end
