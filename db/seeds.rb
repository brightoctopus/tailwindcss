if Rails.env.development?
  Artist.destroy_all
  Tag.destroy_all
end

tags = %w[rock blues hip\ hop pop jazz]

artists_attributes = [
  {
    name: "Jimi Hendrix",
    image_url: "https://res.cloudinary.com/opratododia/image/upload/v1532732218/jimi_hendrix_kyegew.jpg",
    albums: [
      {
        title: "Are You Experienced",
        image_url: "https://res.cloudinary.com/opratododia/image/upload/v1576542183/iu_l4fc44.jpg",
      },
      {
        title: "Bold as Love",
        image_url: "https://res.cloudinary.com/opratododia/image/upload/v1576542167/iu_hagpp0.jpg"
      }
    ],
    tags:%w[rock blues]
  },

  {
    name: "Gang Starr",
    image_url: "https://res.cloudinary.com/opratododia/image/upload/v1532732218/gang_starr_roc18v.jpg",
    tags: %w[hip\ hop]
  },

  {
    name: "Refused",
    image_url: "https://res.cloudinary.com/opratododia/image/upload/v1532732218/refused_uj5ose.jpg",
    tags: %w[rock]
  },

  {
    name: "Cookin' Soul",
    image_url: "https://res.cloudinary.com/opratododia/image/upload/v1532732217/cookin_soul_nmjhbx.jpg",
    tags: %w[hip\ hop]
  },

  {
    name: "Fu Manchu",
    image_url: "https://res.cloudinary.com/opratododia/image/upload/v1532732218/fu_manchu_m6puwu.jpg",
    tags: %w[rock],
    albums: [
      {
        title: "In Search Of...",
        image_url: "https://res.cloudinary.com/opratododia/image/upload/v1532761215/in_search_mrytfh.jpg",
      },
      {
        title: "Daredevil",
        image_url: "https://res.cloudinary.com/opratododia/image/upload/v1532761304/daredevil_khcfes.jpg"
      },
      {
        title: "The Actions is Go",
        image_url: "https://res.cloudinary.com/opratododia/image/upload/v1532761387/action_is_czbor8.jpg"
      }
    ]
  },

  {
    name: "Little Brother",
    image_url: "https://res.cloudinary.com/opratododia/image/upload/v1532732247/littler_brother_ubz289.jpg",
    tags: %w[hip\ hop]
  }
]

tags.each do |tag|
  Tag.create(name: tag)
end

artists_attributes.each do |attributes|
  albums = attributes.delete(:albums)
  tags = attributes.delete(:tags)

  artist = Artist.create!(attributes)
  artist.tags << Tag.where(name: tags) unless tags.nil?

  next if albums.nil?

  albums.each do |album|
    Album.create!(album.merge(artist: artist))
  end
end