module GenresHelper
  def genres_to_buttons(genres)
    raw genres.map { |g| link_to g.name, genre_path(id: g.id), class: 'btn-xs btn-primary' }.join(' ')
  end
end
