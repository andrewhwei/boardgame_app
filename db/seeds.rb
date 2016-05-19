User.create!([
  {email: "user@test.com", encrypted_password: "$2a$11$SOEpVQBPEkzzCOqXLRPtxO.PEu.jpGTXXxydDI33pl2j/B9VbjUaW", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 12, current_sign_in_at: "2016-05-19 15:23:43", last_sign_in_at: "2016-05-19 01:24:55", current_sign_in_ip: "::1", last_sign_in_ip: "::1", phone_number: "4084325748", location: "13850 Saratoga Ave, Saratoga, CA", bio: "Hi! My name is John Doe. I live in the South Bay Area. I just moved into the area, and I am looking for a regular gaming group! I generally enjoy American games with a lot of conflict, but I am open to anything. ", admin: false, first_name: "Jay", last_name: "Doe"},
  {email: "admin@test.com", encrypted_password: "$2a$11$UsZtshjDHemB918DFtjrs.802udB8NO6UQRvScHmAU5AjgHWyYcGm", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2016-05-17 17:44:23", last_sign_in_at: "2016-05-15 23:20:35", current_sign_in_ip: "::1", last_sign_in_ip: "::1", phone_number: nil, location: nil, bio: nil, admin: true, first_name: nil, last_name: nil}
])
Boardgame.create!([
  {name: "Agricola", developer: "Uwe Rosenberg"},
  {name: "Pandemic", developer: "Matt Leacock"},
  {name: "Dominion", developer: "Donald X. Vaccarino"},
  {name: "Carcassonne", developer: "Klaus-Jürgen Wrede"},
  {name: "For Sale", developer: "Stefan Dorra"},
  {name: "Saint Petersburg", developer: "Bernd Brunnhofer"},
  {name: "BANG!", developer: "Emiliano Sciarra"},
  {name: "Blood Rage", developer: "Eric Lang"},
  {name: "The Resistance", developer: "Don Eskridge"},
  {name: "Space Hulk: Death Angel", developer: "Corey Konieczka"}
])
CategorizedBoardgame.create!([
  {category_id: 2, boardgame_id: 2},
  {category_id: 4, boardgame_id: 2},
  {category_id: 5, boardgame_id: 2},
  {category_id: 6, boardgame_id: 2},
  {category_id: 7, boardgame_id: 2},
  {category_id: 2, boardgame_id: 4},
  {category_id: 11, boardgame_id: 4},
  {category_id: 8, boardgame_id: 4},
  {category_id: 12, boardgame_id: 4},
  {category_id: 13, boardgame_id: 4},
  {category_id: 7, boardgame_id: 4},
  {category_id: 6, boardgame_id: 5},
  {category_id: 14, boardgame_id: 5},
  {category_id: 8, boardgame_id: 5},
  {category_id: 15, boardgame_id: 6},
  {category_id: 16, boardgame_id: 6},
  {category_id: 17, boardgame_id: 6},
  {category_id: 4, boardgame_id: 7},
  {category_id: 18, boardgame_id: 7},
  {category_id: 8, boardgame_id: 8},
  {category_id: 19, boardgame_id: 8},
  {category_id: 6, boardgame_id: 9},
  {category_id: 13, boardgame_id: 9},
  {category_id: 10, boardgame_id: 3},
  {category_id: 9, boardgame_id: 3},
  {category_id: 6, boardgame_id: 3},
  {category_id: 8, boardgame_id: 3},
  {category_id: 20, boardgame_id: 10},
  {category_id: 11, boardgame_id: 10},
  {category_id: 21, boardgame_id: 10},
  {category_id: 7, boardgame_id: 10},
  {category_id: 8, boardgame_id: 10},
  {category_id: 7, boardgame_id: 11},
  {category_id: 23, boardgame_id: 11},
  {category_id: 22, boardgame_id: 11},
  {category_id: 8, boardgame_id: 11},
  {category_id: 15, boardgame_id: 11}
])
Category.create!([
  {mechanism: "Action point allowance system"},
  {mechanism: "Area control"},
  {mechanism: "Area movement"},
  {mechanism: "Card drafting"},
  {mechanism: "Variable player powers"},
  {mechanism: "Hand management"},
  {mechanism: "Worker placement"},
  {mechanism: "Area enclosure"},
  {mechanism: "Co-operative play"},
  {mechanism: "Point to point movement"},
  {mechanism: "Set collection"},
  {mechanism: "Deck building"},
  {mechanism: "Partnerships"},
  {mechanism: "Simultaneous action selection"},
  {mechanism: "Voting"},
  {mechanism: "Tile placement"},
  {mechanism: "Bidding"},
  {mechanism: "Action / movement programming"},
  {mechanism: "Dice rolling"},
  {mechanism: "Player elimination"},
  {mechanism: "Take that"}
])
Ownership.create!([
  {user_id: 2, boardgame_id: 6, rating: 9, num_of_plays: 12},
  {user_id: 2, boardgame_id: 2, rating: 10, num_of_plays: 2},
  {user_id: 2, boardgame_id: 10, rating: 8, num_of_plays: 3}
])
Picture.create!([
  {user_id: 2, link: "http://orig04.deviantart.net/aded/f/2013/066/c/2/profile_picture_by_naivety_stock-d5x8lbn.jpg"},
  {user_id: 2, link: "https://s-media-cache-ak0.pinimg.com/736x/7f/38/83/7f388315dd991c282119b0c6608682ab.jpg"}
])
