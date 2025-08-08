if Rails.env.test?
  Mushroom.delete_all
  Mushroom.create!(name: '07_30_2024_wrj_yellow_front_yard',
    description: 'Large yellow mushroom in pine bark - front yard',
    comments: 'What can I say?')
  Mushroom.create!(name: '07_30_2024_wrj_red_back_yard',
    description: 'Large re mushroom in pine bark - front yard',
    comments: 'All has been said')
  Mushroom.create!(name: '07_31_2024_wrj_blue_side_yard',
    description: 'Small blue mushroom in grass - side yard',
    comments: 'Did you say what?')
  Mushroom.create!(name: '07_31_2024_wrj_pink_back_yard',
    description: 'Tiny pink mushroom in pine straw - bak yard',
    comments: 'All has been said')
  Mushroom.create!(name: '07_29_2024_wrj_white_front_yard',
    description: 'Large white mushroom in pine bark - front yard',
    comments: 'White, I said?')
  Mushroom.create!(name: '07_29_2024_wrj_beige_back_yard',
    description: 'Medium beige mushroom in pine bark - front yard',
    comments: 'What color is beige?')
  end
