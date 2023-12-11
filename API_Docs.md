# API Docs

> Base URL:  https://middleman-api-8d134831a182.herokuapp.com/api/v1/


| purpose | url | verb | request params | notes |
| --------| --- | ---- | -------------- | ----- |
| get top 20 games | /board_games | GET | none | none |
| get top 20 games by subcategory | /board_games | GET | ?subcategory= | subcategories: abstracts_rank, cgs_rank, childrens_games_rank, family_games_rank, party_games_rank, strategy_games_rank, thematic_rank, wargames_rank |
| get the top 20 cooperative games | /board_games | GET | ?cooperative=true | none | 
| get the top 20, 2 player games | /board_games | GET | ?max_players=2 | none | 
| search by parameters | /board_games/all_by_params | GET | ?<parameter=> | you can include any of the following as params: categories, min_players, max_players, cooperative(T/F) | 
| get a user's favorites | /users/:id/favorites | GET | none | none |

## Sample Responses (happy path)
**Please note that there will be 20 games for each of these calls, but for the sake of this documentation, we've included 2 per call.**

> **Get a list of top 20 games ⇒ GET /board_games**

```
{
    "data": [
        {
            "id": "1",
            "type": "board_games",
            "attributes": {
                "bgg_id": 224517,
                "title": "Brass: Birmingham",
                "image_path": "https://cf.geekdo-images.com/x3zxjr-Vw5iU4yDPg70Jgw__original/img/FpyxH41Y6_ROoePAilPNEhXnzO8=/0x0/filters:format(jpeg)/pic3490053.jpg",
                "min_players": 2,
                "max_players": 4,
                "min_playtime": 60,
                "max_playtime": 120,
                "categories": "Age of Reason, Economic, Industry / Manufacturing, Post-Napoleonic, Trains, Transportation",
                "cooperative": false,
                "description": "Brass: Birmingham is an economic strategy game sequel to Martin Wallace' 2007 masterpiece, Brass. Brass: Birmingham tells the story of competing entrepreneurs in Birmingham during the industrial revolution, between the years of 1770-1870.&#10;&#10;It offers a very different story arc and experience from its predecessor. As in its predecessor, you must develop, build, and establish your industries and network, in an effort to exploit low or high market demands. The game is played over two halves: the canal era (years 1770-1830) and the rail era (years 1830-1870). To win the game, score the most VPs. VPs are counted at the end of each half for the canals, rails and established (flipped) industry tiles.&#10;&#10;Each round, players take turns according to the turn order track, receiving two actions to perform any of the following actions (found in the original game):&#10;&#10;1) Build - Pay required resources and place an industry tile.&#10;2) Network - Add a rail / canal link, expanding your network.&#10;3) Develop - Increase the VP value of an industry.&#10;4) Sell - Sell your cotton, manufactured goods and pottery.&#10;5) Loan - Take a &pound;30 loan and reduce your income.&#10;&#10;Brass: Birmingham also features a new sixth action:&#10;&#10;6) Scout - Discard three cards and take a wild location and wild industry card. (This action replaces Double Action Build in original Brass.)&#10;&#10;",
                "rating": 8.42201,
                "year_published": 2018,
                "rank": 1,
                "abstracts_rank": null,
                "cgs_rank": null,
                "childrens_games_rank": null,
                "family_games_rank": null,
                "party_games_rank": null,
                "strategy_games_rank": 1,
                "thematic_rank": null,
                "wargames_rank": null
            }
        },
        {
            "id": "2",
            "type": "board_games",
            "attributes": {
                "bgg_id": 161936,
                "title": "Pandemic Legacy: Season 1",
                "image_path": "https://cf.geekdo-images.com/-Qer2BBPG7qGGDu6KcVDIw__original/img/PlzAH7swN1nsFxOXbfUvE3TkE5w=/0x0/filters:format(png)/pic2452831.png",
                "min_players": 2,
                "max_players": 4,
                "min_playtime": 60,
                "max_playtime": 60,
                "categories": "Environmental, Medical",
                "cooperative": true,
                "description": "Pandemic Legacy is a co-operative campaign game, with an overarching story-arc played through 12-24 sessions, depending on how well your group does at the game. At the beginning, the game starts very similar to basic Pandemic, in which your team of disease-fighting specialists races against the clock to travel around the world, treating disease hotspots while researching cures for each of four plagues before they get out of hand.&#10;&#10;During a player's turn, they have four actions available, with which they may travel around in the world in various ways (sometimes needing to discard a card), build structures like research stations, treat diseases (removing one cube from the board; if all cubes of a color have been removed, the disease has been eradicated), trade cards with other players, or find a cure for a disease (requiring five cards of the same color to be discarded while at a research station). Each player has a unique role with special abilities to help them at these actions.&#10;&#10;After a player has taken their actions, they draw two cards. These cards can include epidemic cards, which will place new disease cubes on the board, and can lead to an outbreak, spreading disease cubes even further. Outbreaks additionally increase the panic level of a city, making that city more expensive to travel to.&#10;&#10;Each month in the game, you have two chances to achieve that month's objectives. If you succeed, you win and immediately move on to the next month. If you fail, you have a second chance, with more funding for beneficial event cards.&#10;&#10;During the campaign, new rules and components will be introduced. These will sometimes require you to permanently alter the components of the game; this includes writing on cards, ripping up cards, and placing permanent stickers on components. Your characters can gain new skills, or detrimental effects. A character can even be lost entirely, at which point it's no longer available for play.&#10;&#10;Part of the Pandemic series&#10;&#10;",
                "rating": 8.38609,
                "year_published": 2015,
                "rank": 2,
                "abstracts_rank": null,
                "cgs_rank": null,
                "childrens_games_rank": null,
                "family_games_rank": null,
                "party_games_rank": null,
                "strategy_games_rank": 2,
                "thematic_rank": 1,
                "wargames_rank": null
            }
        },
    ]
}


```
> **Get a list of top 20 games by subcategory ⇒ GET /board_games?subcategory=family_games_rank**
```
{
    "data": [
        {
            "id": "36",
            "type": "board_games",
            "attributes": {
                "bgg_id": 324856,
                "title": "The Crew: Mission Deep Sea",
                "image_path": "https://cf.geekdo-images.com/VuBqZ1sMaDAVVHF_OEJP4g__original/img/jGWxczXC_VWZofeAmlO_DkB0hCI=/0x0/filters:format(jpeg)/pic5988903.jpg",
                "min_players": 2,
                "max_players": 5,
                "min_playtime": 20,
                "max_playtime": 20,
                "categories": "Card Game, Nautical, Science Fiction",
                "cooperative": true,
                "description": "In the trick-taking card game The Crew: Mission Deep Sea, you and the other players work together to search for the lost continent of Mu. This new adventure takes your crew deep down into the abyss on a search for the fabled sunken land. How far you get depends entirely on how well you work together as a team. Card by card, trick by trick, your search party will discover the challenges that lie ahead and forge a path to Mu.&#10;&#10;This new version of The Crew has the same innovative co-operative trick-taking mechanism as the highly lauded original game &mdash; but with some exciting new surprises! While communication between your crew members is severely limited by your submerged state, it is also critical to your success; finding the hidden land in the murky depths depends not only on winning tricks, but also on carefully negotiating the order in which they are won. If things don't go as planned, you might just be able to salvage the operation, but it will take near flawless execution and perhaps a little luck to finally reach Mu.&#10;&#10;&mdash;description from the publisher&#10;&#10;",
                "rating": 7.84697,
                "year_published": 2021,
                "rank": 36,
                "abstracts_rank": null,
                "cgs_rank": null,
                "childrens_games_rank": null,
                "family_games_rank": 1,
                "party_games_rank": null,
                "strategy_games_rank": null,
                "thematic_rank": null,
                "wargames_rank": null
            }
        },
        {
            "id": "25",
            "type": "board_games",
            "attributes": {
                "bgg_id": 266192,
                "title": "Wingspan",
                "image_path": "https://cf.geekdo-images.com/yLZJCVLlIx4c7eJEWUNJ7w__original/img/cI782Zis9cT66j2MjSHKJGnFPNw=/0x0/filters:format(jpeg)/pic4458123.jpg",
                "min_players": 1,
                "max_players": 5,
                "min_playtime": 40,
                "max_playtime": 70,
                "categories": "Animals, Card Game, Educational",
                "cooperative": false,
                "description": "Wingspan is&nbsp;a competitive, medium-weight, card-driven, engine-building board game from Stonemaier Games. It's designed by Elizabeth Hargrave and features over 170 birds illustrated by Beth Sobel, Natalia Rojas, and Ana Maria Martinez.&#10;&#10;You are bird enthusiasts&mdash;researchers, bird watchers, ornithologists, and collectors&mdash;seeking to discover and attract the best birds to your network of wildlife preserves. Each bird extends a chain of powerful combinations in one of your habitats (actions). These habitats  focus on several key aspects of growth:&#10;&#10;&#10;     Gain food tokens via custom dice in a birdfeeder dice tower&#10;     Lay eggs using egg miniatures in a variety of colors&#10;     Draw from hundreds of unique bird cards and play them&#10;&#10;&#10;The winner is the player with the most points after 4 rounds.&#10;&#10;&mdash;description from the publisher&#10;&#10;From the 7th printing on, the base game box includes Wingspan: Swift-Start Promo Pack.&#10;&#10;",
                "rating": 7.91612,
                "year_published": 2019,
                "rank": 25,
                "abstracts_rank": null,
                "cgs_rank": null,
                "childrens_games_rank": null,
                "family_games_rank": 2,
                "party_games_rank": null,
                "strategy_games_rank": 33,
                "thematic_rank": null,
                "wargames_rank": null
            }
        },
    ]
}
```

> **Get the top 20 cooperative games ⇒ GET /board_games?cooperative=true**
```
{
    "data": [
        {
            "id": "2",
            "type": "board_games",
            "attributes": {
                "bgg_id": 161936,
                "title": "Pandemic Legacy: Season 1",
                "image_path": "https://cf.geekdo-images.com/-Qer2BBPG7qGGDu6KcVDIw__original/img/PlzAH7swN1nsFxOXbfUvE3TkE5w=/0x0/filters:format(png)/pic2452831.png",
                "min_players": 2,
                "max_players": 4,
                "min_playtime": 60,
                "max_playtime": 60,
                "categories": "Environmental, Medical",
                "cooperative": true,
                "description": "Pandemic Legacy is a co-operative campaign game, with an overarching story-arc played through 12-24 sessions, depending on how well your group does at the game. At the beginning, the game starts very similar to basic Pandemic, in which your team of disease-fighting specialists races against the clock to travel around the world, treating disease hotspots while researching cures for each of four plagues before they get out of hand.&#10;&#10;During a player's turn, they have four actions available, with which they may travel around in the world in various ways (sometimes needing to discard a card), build structures like research stations, treat diseases (removing one cube from the board; if all cubes of a color have been removed, the disease has been eradicated), trade cards with other players, or find a cure for a disease (requiring five cards of the same color to be discarded while at a research station). Each player has a unique role with special abilities to help them at these actions.&#10;&#10;After a player has taken their actions, they draw two cards. These cards can include epidemic cards, which will place new disease cubes on the board, and can lead to an outbreak, spreading disease cubes even further. Outbreaks additionally increase the panic level of a city, making that city more expensive to travel to.&#10;&#10;Each month in the game, you have two chances to achieve that month's objectives. If you succeed, you win and immediately move on to the next month. If you fail, you have a second chance, with more funding for beneficial event cards.&#10;&#10;During the campaign, new rules and components will be introduced. These will sometimes require you to permanently alter the components of the game; this includes writing on cards, ripping up cards, and placing permanent stickers on components. Your characters can gain new skills, or detrimental effects. A character can even be lost entirely, at which point it's no longer available for play.&#10;&#10;Part of the Pandemic series&#10;&#10;",
                "rating": 8.38609,
                "year_published": 2015,
                "rank": 2,
                "abstracts_rank": null,
                "cgs_rank": null,
                "childrens_games_rank": null,
                "family_games_rank": null,
                "party_games_rank": null,
                "strategy_games_rank": 2,
                "thematic_rank": 1,
                "wargames_rank": null
            }
        },
        {
            "id": "3",
            "type": "board_games",
            "attributes": {
                "bgg_id": 174430,
                "title": "Gloomhaven",
                "image_path": "https://cf.geekdo-images.com/sZYp_3BTDGjh2unaZfZmuA__original/img/7d-lj5Gd1e8PFnD97LYFah2c45M=/0x0/filters:format(jpeg)/pic2437871.jpg",
                "min_players": 1,
                "max_players": 4,
                "min_playtime": 60,
                "max_playtime": 120,
                "categories": "Adventure, Exploration, Fantasy, Fighting, Miniatures",
                "cooperative": true,
                "description": "Gloomhaven  is a game of Euro-inspired tactical combat in a persistent world of shifting motives. Players will take on the role of a wandering adventurer with their own special set of skills and their own reasons for traveling to this dark corner of the world. Players must work together out of necessity to clear out menacing dungeons and forgotten ruins. In the process, they will enhance their abilities with experience and loot, discover new locations to explore and plunder, and expand an ever-branching story fueled by the decisions they make.&#10;&#10;This is a game with a persistent and changing world that is ideally played over many game sessions. After a scenario, players will make decisions on what to do, which will determine how the story continues, kind of like a &ldquo;Choose Your Own Adventure&rdquo; book. Playing through a scenario is a cooperative affair where players will fight against automated monsters using an innovative card system to determine the order of play and what a player does on their turn.&#10;&#10;Each turn, a player chooses two cards to play out of their hand. The number on the top card determines their initiative for the round. Each card also has a top and bottom power, and when it is a player&rsquo;s turn in the initiative order, they determine whether to use the top power of one card and the bottom power of the other, or vice-versa. Players must be careful, though, because over time they will permanently lose cards from their hands. If they take too long to clear a dungeon, they may end up exhausted and be forced to retreat.&#10;&#10;",
                "rating": 8.37321,
                "year_published": 2017,
                "rank": 3,
                "abstracts_rank": null,
                "cgs_rank": null,
                "childrens_games_rank": null,
                "family_games_rank": null,
                "party_games_rank": null,
                "strategy_games_rank": 4,
                "thematic_rank": 2,
                "wargames_rank": null
            }
        },
    ]
}
```

> **Get the top 20, 2 player games ⇒ GET /board_games?max_players=2**


```
{
    "data": [
        {
            "id": "13",
            "type": "board_games",
            "attributes": {
                "bgg_id": 12333,
                "title": "Twilight Struggle",
                "image_path": "https://cf.geekdo-images.com/pNCiUUphnoeWOYfsWq0kng__original/img/Iae47UtAd_RXVd5tJ3YzbDHOv4E=/0x0/filters:format(jpeg)/pic3530661.jpg",
                "min_players": 2,
                "max_players": 2,
                "min_playtime": 120,
                "max_playtime": 180,
                "categories": "Modern Warfare, Political, Wargame",
                "cooperative": false,
                "description": "&quot;Now the trumpet summons us again, not as a call to bear arms, though arms we need; not as a call to battle, though embattled we are &ndash; but a call to bear the burden of a long twilight struggle...&quot;&#10;&ndash; John F. Kennedy&#10;&#10;In 1945, unlikely allies toppled Hitler's war machine, while humanity's most devastating weapons forced the Japanese Empire to its knees in a storm of fire. Where once there stood many great powers, there then stood only two. The world had scant months to sigh its collective relief before a new conflict threatened. Unlike the titanic struggles of the preceding decades, this conflict would be waged not primarily by soldiers and tanks, but by spies and politicians, scientists and intellectuals, artists and traitors. Twilight Struggle is a two-player game simulating the forty-five year  dance of intrigue, prestige, and occasional flares of warfare between the Soviet Union and the United States. The entire world is the stage on which these two titans fight to make the world safe for their own ideologies and ways of life. The game begins amidst the ruins of Europe as the two new &quot;superpowers&quot; scramble over the wreckage of the Second World War, and ends in 1989, when only the United States remained standing.&#10;&#10;Twilight Struggle inherits its fundamental systems from the card-driven classics We the People and Hannibal: Rome vs. Carthage. It is a quick-playing, low-complexity game in that tradition. The game map is a world map of the period, whereon players move units and exert influence in attempts to gain allies and control for their superpower. As with GMT's other card-driven games, decision-making is a challenge; how to best use one's cards and units given consistently limited resources?&#10;&#10;Twilight Struggle's Event cards add detail and flavor to the game. They cover a vast array of historical happenings, from the Arab-Israeli conflicts of 1948 and 1967, to Vietnam and the U.S. peace movement, to the Cuban Missile Crisis and other such incidents that brought the world to the brink of nuclear annihilation. Subsystems capture the prestige-laden Space Race as well as nuclear tensions, with the possibility of game-ending nuclear war.&#10;&#10;Components (original edition):&#10;&#10;&#10;     228 full colour counters &#10;     22&quot;x34&quot; full colour map &#10;     103 event cards &#10;     2 six-sided dice&#10;     1 24-page rulebook&#10;     2 full colour player aid cards&#10;&#10;&#10;Components (2009 Deluxe edition and after)&#10;&#10;     260 full colour counters &#10;     22&quot;x34&quot; mounted map with revised graphics&#10;     110 event cards&#10;     2 six-sided dice&#10;     1 24-page rulebook&#10;     2 full colour player aid cards&#10;&#10;&#10;TIME SCALE:     approx. 3-5 years per turn&#10;MAP SCALE:     Point-to-point system&#10;UNIT SCALE:     Influence markers&#10;NUMBER OF PLAYERS:     2&#10;&#10;DESIGNER: Ananda Gupta &amp; Jason Matthews&#10;MAP, CARD, &amp; COUNTER ART: Mark Simonitch&#10;&#10;&#10;A deluxe edition, published in 2009 includes the following changes from the basic game:&#10;&#10;     Mounted map with revised graphics&#10;     Two double-thick counter sheets with 260 counters&#10;     Deck of 110 event cards (increased from 103)&#10;     Revised rules and player aid cards&#10;     Revised at start setup and text change for card #98 Aldrich Ames&#10;&#10;&#10;Upgrade kit for the owners of the previous version includes the following:&#10;&#10;     Mounted Map with revised graphics&#10;     New card decks&#10;     Updated Rules &amp; Charts&#10;&#10;&#10;",
                "rating": 8.07634,
                "year_published": 2005,
                "rank": 13,
                "abstracts_rank": null,
                "cgs_rank": null,
                "childrens_games_rank": null,
                "family_games_rank": null,
                "party_games_rank": null,
                "strategy_games_rank": 13,
                "thematic_rank": null,
                "wargames_rank": 2
            }
        },
        {
            "id": "18",
            "type": "board_games",
            "attributes": {
                "bgg_id": 173346,
                "title": "7 Wonders Duel",
                "image_path": "https://cf.geekdo-images.com/zdagMskTF7wJBPjX74XsRw__original/img/Ju836WNSaW7Mab9Vjq2TJ_FqhWQ=/0x0/filters:format(jpeg)/pic2576399.jpg",
                "min_players": 2,
                "max_players": 2,
                "min_playtime": 30,
                "max_playtime": 30,
                "categories": "Ancient, Card Game, City Building, Civilization, Economic",
                "cooperative": false,
                "description": "In many ways 7 Wonders Duel resembles its parent game 7 Wonders as over three ages players acquire cards that provide resources or advance their military or scientific development in order to develop a civilization and complete wonders.&#10;&#10;What's different about 7 Wonders Duel is that, as the title suggests, the game is solely for two players, with the players not drafting cards simultaneously from hands of cards, but from a display of face-down and face-up cards arranged at the start of a round. A player can take a card only if it's not covered by any others, so timing comes into play as well as bonus moves that allow you to take a second card immediately. As in the original game, each card that you acquire can be built, discarded for coins, or used to construct a wonder.&#10;&#10;Each player starts with four wonder cards, and the construction of a wonder provides its owner with a special ability. Only seven wonders can be built, though, so one player will end up short.&#10;&#10;Players can purchase resources at any time from the bank, or they can gain cards during the game that provide them with resources for future building; as you acquire resources, the cost for those particular resources increases for your opponent, representing your dominance in this area.&#10;&#10;A player can win 7 Wonders Duel in one of three ways: each time you acquire a military card, you advance the military marker toward your opponent's capital, giving you a bonus at certain positions; if you reach the opponent's capital, you win the game immediately; similarly, if you acquire any six of seven different scientific symbols, you achieve scientific dominance and win immediately; if none of these situations occurs, then the player with the most points at the end of the game wins.&#10;&#10;",
                "rating": 7.97223,
                "year_published": 2015,
                "rank": 18,
                "abstracts_rank": null,
                "cgs_rank": null,
                "childrens_games_rank": null,
                "family_games_rank": null,
                "party_games_rank": null,
                "strategy_games_rank": 22,
                "thematic_rank": null,
                "wargames_rank": null
            }
        },
    ]
}
```

> **Delete a user ⇒ DELETE /users/2**
```
{
    "current_page": "1",
    "total_pages": "1",
    "data": [
        {
            "id": "2",
            "type": "board_games",
            "attributes": {
                "bgg_id": 161936,
                "title": "Pandemic Legacy: Season 1",
                "image_path": "https://cf.geekdo-images.com/-Qer2BBPG7qGGDu6KcVDIw__original/img/PlzAH7swN1nsFxOXbfUvE3TkE5w=/0x0/filters:format(png)/pic2452831.png",
                "min_players": 2,
                "max_players": 4,
                "min_playtime": 60,
                "max_playtime": 60,
                "categories": "Environmental, Medical",
                "cooperative": true,
                "description": "Pandemic Legacy is a co-operative campaign game, with an overarching story-arc played through 12-24 sessions, depending on how well your group does at the game. At the beginning, the game starts very similar to basic Pandemic, in which your team of disease-fighting specialists races against the clock to travel around the world, treating disease hotspots while researching cures for each of four plagues before they get out of hand.&#10;&#10;During a player's turn, they have four actions available, with which they may travel around in the world in various ways (sometimes needing to discard a card), build structures like research stations, treat diseases (removing one cube from the board; if all cubes of a color have been removed, the disease has been eradicated), trade cards with other players, or find a cure for a disease (requiring five cards of the same color to be discarded while at a research station). Each player has a unique role with special abilities to help them at these actions.&#10;&#10;After a player has taken their actions, they draw two cards. These cards can include epidemic cards, which will place new disease cubes on the board, and can lead to an outbreak, spreading disease cubes even further. Outbreaks additionally increase the panic level of a city, making that city more expensive to travel to.&#10;&#10;Each month in the game, you have two chances to achieve that month's objectives. If you succeed, you win and immediately move on to the next month. If you fail, you have a second chance, with more funding for beneficial event cards.&#10;&#10;During the campaign, new rules and components will be introduced. These will sometimes require you to permanently alter the components of the game; this includes writing on cards, ripping up cards, and placing permanent stickers on components. Your characters can gain new skills, or detrimental effects. A character can even be lost entirely, at which point it's no longer available for play.&#10;&#10;Part of the Pandemic series&#10;&#10;",
                "rating": 8.38609,
                "year_published": 2015,
                "rank": 2,
                "abstracts_rank": null,
                "cgs_rank": null,
                "childrens_games_rank": null,
                "family_games_rank": null,
                "party_games_rank": null,
                "strategy_games_rank": 2,
                "thematic_rank": 1,
                "wargames_rank": null
            }
        },
        {
            "id": "55",
            "type": "board_games",
            "attributes": {
                "bgg_id": 221107,
                "title": "Pandemic Legacy: Season 2",
                "image_path": "https://cf.geekdo-images.com/Qtkb-UTvHa0-kxt_MK1nKw__original/img/wJiRr7lBmWSKcRS3lPpvKIPMgQQ=/0x0/filters:format(jpeg)/pic3763549.jpg",
                "min_players": 2,
                "max_players": 4,
                "min_playtime": 60,
                "max_playtime": 60,
                "categories": "Environmental, Exploration, Medical, Science Fiction",
                "cooperative": true,
                "description": "Description from the publisher:&#10;&#10;The world almost ended 71 years ago...&#10;&#10;The plague came out of nowhere and ravaged the world. Most died within a week. Nothing could stop it. The world did its best. It wasn't good enough.&#10;&#10;For three generations, we, the last fragments of humanity have lived on the seas, on floating stations called &quot;havens.&quot; Far from the plague, we are able to provide supplies to the mainland to keep them (and us) from succumbing completely.&#10;&#10;We've managed to keep a network of the largest known cities in the world alive. Things have been tough the past few years. Cities far away from the havens have fallen off our grid...&#10;&#10;Tomorrow, a small group of us head out into what's left of the world. We don't know what we'll find.&#10;&#10;Pandemic Legacy: Season 2 is an epic cooperative game for 2 to 4 players. Unlike most other games, this one is working against you. What's more, some of the actions you take in Pandemic Legacy will carry over to future games. No two worlds will ever be alike!&#10;&#10;Part of the Pandemic series.&#10;&#10;",
                "rating": 7.73295,
                "year_published": 2017,
                "rank": 55,
                "abstracts_rank": null,
                "cgs_rank": null,
                "childrens_games_rank": null,
                "family_games_rank": null,
                "party_games_rank": null,
                "strategy_games_rank": 43,
                "thematic_rank": 15,
                "wargames_rank": null
            }
        },
    ]
}
```


