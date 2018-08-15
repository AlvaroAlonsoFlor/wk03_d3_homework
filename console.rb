require_relative('models/artist')
require_relative('models/album')
require('pry-byebug')

artist1 = Artist.new({
  'name' => 'Mike Olfield'
  })

artist1.save()

album1 = Album.new({
  'title' => 'Tubular Bells',
  'genre' => 'instrumental',
  'artist_id' => artist1.id
  })

album2 = Album.new({
  'title' => 'Tubular Bells II',
  'genre' => 'instrumental',
  'artist_id' => artist1.id
  })




album1.save()
album2.save()

binding.pry
nil
