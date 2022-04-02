class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark = Bookmark.find(params[:id])
    @bookmark.save
    if @bookmark.save
      redirect_to list_path(@bookmark)
    else
    render :new
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
