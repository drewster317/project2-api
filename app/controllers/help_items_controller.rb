# HelpItems Controller
class HelpItemsController < ApplicationController

  before_action :set_help_item, only: [:show, :update, :destroy]

  # GET /help_item
  def index

  #   if current_user
  #     if current_user.instructor_role?
  #       help_items = current_user.instructor_help_items
  #     else
  #       help_items = current_user.student_help_items
  #     end
  #   else
  #     help_items = HelpItem.all
  #   end

    help_items = HelpItem.all
    render json: help_items
  end

  # GET /help_item/1
  def show
    if current_help_item == @help_item
      render json: @help_item, serializer: CurrentHelpItemSerializer,
             root: 'help_item'
    else
      render json: @help_item
    end
  end

  def create
    q = HelpItem.create(help_item_params)
    # movie points to an object if create was successfully,
    # else movie points to false
    if q.save
      render json: q, status: :created
    else
      render json: q.errors, status: :unprocessable_entity
    end
  end

  # PATCH /help_items/1
  def update
    if current_help_item == @help_item
      if @help_item.update(help_item_params)
        head :no_content
      else
        render json: @help_item.errors, status: :unprocessable_entity
      end
    else
      head :unauthorized
    end
  end

  # DELETE /help_items/1
  def destroy
    HelpItem.find(params[:id]).destroy
    head :ok
  end

  private

  def set_help_item
    @help_item = HelpItem.find(params[:id])
  end

  def help_item_params
    params.require(:help_item).permit(
      :student_id,
      :instructor_id
    )
  end
end
