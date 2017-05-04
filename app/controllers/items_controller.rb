# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, only: %i[show update destroy]
  before_action :validate_user, only: %i[index create update destroy set_item]

  # GET /items
  def index
    # filter by user_id
    # @items = Item.all
    @items = current_user.items

    render json: @items
  end

  # GET /items/1
  def show
    render json: @item
  end

  # POST /items
  def create
    # get current user_ID from application_controller
    @item = current_user.items.build(item_params)

    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    # @item = Item.find(params[:id])
    validate_user
    @item = current_user.items.find(params[:id])
  end

  def validate_user
    set_current_user
  end

  # Only allow a trusted parameter "white list" through.
  def item_params
    params.require(:item).permit(:title, :body)
  end
end
