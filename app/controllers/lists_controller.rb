class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
   @lists = List.all
   @list=List.new(list_params)
   if @list.save
     redirect_to list_path(@list.id)
   else
    render :index
   end
  end

  # def create
  # list=List.new(list_params)
  # list.save
  # redirect_to list_path(list.id)
  # end

  def show
    @list = List.find(params[:id])
  end

  def index
    @lists = List.all
    @list = List.new
  end

  def edit
    @list =List.find(params[:id])
  end

  def update
    @list=List.find(params[:id])
    if @list.update(list_params)
       redirect_to list_path(@list.id)
       flash[:notice] = "更新しました！！！"
    else
      render :edit
    end
  end

 # def update
 #  list=List.find(params[:id])
 #  list.update(list_params)
 #  redirect_to list_path(list.id)
 # end



  def destroy
    list=List.find(params[:id])
    list.destroy
    redirect_to "/lists"
    flash[:notic] = "削除しました。"
  end

  private

  def list_params
   params.require(:list).permit(:title, :body,:image)
  end

#  def list_params
#   params.require(:list).permit(:title, :body,:image)
#  end  newページ使えない

end
