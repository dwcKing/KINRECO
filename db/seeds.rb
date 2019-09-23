# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Label.create!(
  [
    {
      label_name: 'ぐっさんカンパニー'
    },
    {
      label_name: 'GUSSAN'
    }
  ]
)

Genre.create!(
  [
    {
      genre_name: 'JPOP'
    }
  ]
)

Item.create!(
 [
  {
   title: '泳げたいやきくん',
   price: 2500,
   artist: 'ぐっさん',
   disc_type: 'シングル',
   selling_status: 1,
   label_id: 2,
   genre_id: 1,
   comment: 'みんな大好き泳げたいやきくん'
  },
  {
   title: 'だんご３兄弟',
   price: 2500,
   artist: 'ぐー',
   disc_type: 'シングル',
   selling_status: 1,
   label_id: 2,
   genre_id: 1,
   comment: 'みんな大嫌いだんご３兄弟'
  },
 ]
)
