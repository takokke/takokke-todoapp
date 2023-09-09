class BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = current_user.boards.build
  end

  def create
    #()にストロングパラメータ
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to board_path(@board), notice: '保存しました'
    else
      flash.now[:error] = '保存できませんでした'
      render :new        #このメソッド内の@boardがnew.html.erbに引き継がれる
    end
  end

  def destroy
    board = current_user.boards.find(params[:id])
    board.destroy!
    redirect_to root_path, notice: '削除しました'
  end

  private

  def board_params
    params.require(:board).permit(:name, :description)
  end

end
