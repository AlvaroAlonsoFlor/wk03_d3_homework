require_relative('models/artist')
require_relative('models/album')
require('pry-byebug')

artist1 = Artist.new({
  'name' => 'Mike Olfield'
  })

album1 = Album.new({
  'title' => 'Tubular Bells',
  'genre' => 'instrumental',
  'artist_id' => '2'
  })

# artist1.save()
# album1.save()

binding.pry
nil
