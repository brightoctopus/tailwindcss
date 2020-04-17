class TagsController < ApplicationController
  def create
    @artist = Artist.find(params[:artist_id])
    names = params[:tags].split(",")

    names.each do |name|
      tag = Tag.where(name: name).first_or_create

      @artist.tags << tag
    end

    redirect_to @artist
  end
end