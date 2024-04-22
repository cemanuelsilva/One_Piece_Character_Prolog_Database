% Facts about One Piece characters
character(luffy, captain, straw_hats, rubber_fruit).
character(zoro, swordsman, straw_hats, santoryu).
character(nami, navigator, straw_hats, climatact).
character(usopp, sniper, straw_hats, kabuto).
character(sanji, cook, straw_hats, black_leg_style).
character(chopper, doctor, straw_hats, human_human_fruit).
character(robin, archaeologist, straw_hats, devil_fruit).
character(franky, shipwright, straw_hats, cola_power).
character(brook, musician, straw_hats, soul_soul_fruit).

character(marshall_d_teach, captain, blackbeard, [dark_dark_fruit, tremor_tremor_fruit] ).
character(laffitte, chief, blackbeard, unconfirmed).
character(van_augur, sniper, blackbeard, warp_warp_fruit).
character(doc_Q, doctor ,blackbeard, sick_sick_fruit).
character(jesus_burgess, helmsman, blackbeard, dark_dark_fruit).
character(shiryu, swordman, blackbeard, clear_clear_fruit).
character(avalo_pizarro, titanic, blackbeard, isle_isle_fruit).
character(vasco_shot, titanic, blackbeard, glug_glug_fruit).
character(catarina_devon, titanic, blackbeard, dog_dog_fruit).
character(kuzan ,titanic, blackbeard, ice_ice_fruit).
character(san_juan_wold ,titanic, blackbeard, huge_huge_fruit).

% Predicate to check if a character is a captain
is_captain(Character) :-
    character(Character, captain, _, _).

% Predicate to check if a character is from a specific crew
is_from_crew(Character, Crew) :-
    character(Character, _, Crew, _).

% Predicate to check if a character has a specific Devil Fruit
has_devil_fruit(Character, Fruit) :-
    character(Character, _, _, Fruits),
    member(Fruit, Fruits).
