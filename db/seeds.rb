Boardgame.create!([
  {name: "Blood Rage", developer: "Eric Lang"},
  {name: "Agricola", developer: "Uwe Rosenberg"},
  {name: "Pandemic", developer: "Matt Leacock"},
  {name: "Dominion", developer: "Donald X. Vaccarino"},
  {name: "The Resistance", developer: "Don Eskridge"},
  {name: "Carcassonne", developer: "Klaus-Jürgen Wrede"},
  {name: "For Sale", developer: "Stefan Dorra"},
  {name: "Saint Petersburg", developer: "Bernd Brunnhofer"},
  {name: "Space Hulk: Death Angel", developer: "Corey Konieczka"},
  {name: "BANG!", developer: "Emiliano Sciarra"}
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
