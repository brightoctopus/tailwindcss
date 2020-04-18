class AddImageUrlToArtistsAndAlbums < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :image_url, :string
    add_column :albums, :image_url, :string
  end
end
