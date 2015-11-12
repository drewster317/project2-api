#
class HelpQueuesController < ApplicationController
  before_action :set_helpQueue, only: [:show, :update, :destroy]

  # GET /helpQueues
  def index
    @helpQueues = HelpQueue.all

    render json: @helpQueues
  end

  # GET /helpQueues/1
  def show
    if current_helpQueue == @helpQueue
      render json: @helpQueue, serializer: CurrentHelpQueueSerializer, root: 'helpQueue'
    else
      render json: @helpQueue
    end
  end

   def create
    q = HelpQueue.create(helpQueue_params)
    # movie points to an object if create was successfully, else movie points to false
    if q.save
      render json: q, status: :created
    else
      render json: q.errors, status: :unprocessable_entity
    end
  end

  # PATCH /helpQueues/1
  def update
    if current_helpQueue == @helpQueue
      if @helpQueue.update(helpQueue_params)
        head :no_content
      else
        render json: @helpQueue.errors, status: :unprocessable_entity
      end
    else
      head :unauthorized
    end
  end

  # DELETE /helpQueues/1
  def destroy
    if current_helpQueue == @helpQueue
      @helpQueue.destroy
      head :no_content
    else
      head :unauthorized
    end
  end

  def set_helpQueue
    @helpQueue = HelpQueue.find(params[:id])
  end

  private :set_helpQueue
  private
  def helpQueue_params
    params.require(:help_queue).permit(
    :student_id,
    :instructor_id
    )
  end
end
