class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update, :destroy]

  def show
    @task = Task.find(params[:id])
  end

  def new
    board = Board.find(params[:board_id])
    # Taskクラスのオブジェクトを作成(board_idと共に)
    @task = board.tasks.build
    # Taskのuser_idカラムにcurrent_userを格納
    user = current_user
    @task.user = user
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    user = current_user
    @task.user = user
    if @task.save
      redirect_to board_path(board), notice: '追加しました'
    else
      flash.now[:error] = '追加できませんでした'
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def task_params
    params.require(:task).permit(
      :title,
      :content,
      :deadline,
      :eyecatch
    )
  end

end
