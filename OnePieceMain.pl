% Facts about One Piece characters
% Straw_hats_Pirates
character(luffy, captain, straw_hats, [rubber_fruit]).
character(zoro, swordsman, straw_hats, []).
character(nami, navigator, straw_hats, []).
character(usopp, sniper, straw_hats, []).
character(sanji, cook, straw_hats, [black_leg_style]).
character(chopper, doctor, straw_hats, [human_human_fruit]).
character(robin, archaeologist, straw_hats, [hana_hana_fruit]).
character(franky, shipwright, straw_hats, []).
character(brook, musician, straw_hats, [soul_soul_fruit]).

%Blackbeard_Pirates
character(marshall_d_teach, captain, blackbeard, [dark_dark_fruit, tremor_tremor_fruit]).
character(laffitte, chief, blackbeard, [unconfirmed]).
character(van_augur, sniper, blackbeard, [warp_warp_fruit]).
character(doc_Q, doctor ,blackbeard, [sick_sick_fruit]).
character(jesus_burgess, helmsman, blackbeard, [dark_dark_fruit]).
character(shiryu, swordman, blackbeard, [clear_clear_fruit]).
character(avalo_pizarro, titanic, blackbeard, [isle_isle_fruit]).
character(vasco_shot, titanic, blackbeard, [glug_glug_fruit]).
character(catarina_devon, titanic, blackbeard, [dog_dog_fruit]).
character(kuzan ,titanic, blackbeard, [ice_ice_fruit]).
character(san_juan_wold ,titanic, blackbeard, [huge_huge_fruit]).

%Red_Haired_Pirates
character(shanks, captain, red_haired_pirates, []).
character(benn_beckman, first_mate, red_haired_pirates, []).
character(lucky_roux, member, red_haired_pirates, []).
character(yasopp, sniper, red_haired_pirates, []).
character(rockstar, member, red_haired_pirates, []).

%Whitebeard_Pirates
character(whitebeard, captain, whitebeard_pirates, [gura_gura_fruit]).
character(marco, first_division_commander, whitebeard_pirates, [phoenix_fruit]).
character(portgas_d_ace, second_division_commander, whitebeard_pirates, [flame_flame_fruit]).
character(jozu, third_division_commander, whitebeard_pirates, [diamond_fruit]).
character(vista, fourth_division_commander, whitebeard_pirates, []).
character(thatch, fifth_division_commander, whitebeard_pirates, []).

%Buggy_Pirates
character(buggy, captain, buggy_pirates, [bara_bara_fruit]).
character(mohji, member, buggy_pirates, []).
character(cabaji, member, buggy_pirates, []).
character(alvida, member, buggy_pirates, [sube_sube_fruit]).


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

% Predicate to show all characters from a crew
show_characters_from_crew(Crew) :-
    character(Character, _, Crew, _),
    write(Character),
    nl,
    fail. % Backtrack to find more characters
show_characters_from_crew(_). % End of search

% Predicate to get the crew of a character
get_crew(Character) :-
    character(Character, _, Crew, _),
    writeln(Crew).

% Predicate to get the role of a character
get_role(Character) :-
    character(Character, Role, _, _),
    writeln(Role).

% Predicate to get the Devil Fruit of a character
get_devil_fruit(Character) :-
    character(Character, _, _, Fruits),
    writeln(Fruits).


% Menu for interacting with the Prolog database

% Main menu
main_menu :-
    writeln('1. Check if a character is a captain'),
    writeln('2. Check if a character is from a specific crew'),
    writeln('3. Check if a character has a specific Devil Fruit'),
    writeln('4. Show all characters from a crew'),
    writeln('5. Get the crew of a character'),
    writeln('6. Get the role of a character'),
    writeln('7. Get the Devil Fruit of a character'),
    writeln('8. Get the Details of a character'),
    writeln('9. Show all characters with a role'),
    writeln('10. Exit'),
    nl,
    write('Insert your choice (1-10): '),
    read_choice.

% Read choice and process input
read_choice :-
    read_line_to_codes(user_input, InputCodes),
    atom_codes(InputAtom, InputCodes),
    atom_number(InputAtom, Input),
    process_input(Input).

% Process user input
process_input(1) :-
    writeln('Enter the character name: '),
    read_line_to_codes(user_input, CharacterCodes),
    atom_codes(CharacterAtom, CharacterCodes),
    process_captain(CharacterAtom),
    nl,
    main_menu.
process_input(2) :-
    writeln('Enter the character name: '),
    read_line_to_codes(user_input, CharacterCodes),
    atom_codes(CharacterAtom, CharacterCodes),
    writeln('Enter the crew name: '),
    read_line_to_codes(user_input, CrewCodes),
    atom_codes(CrewAtom, CrewCodes),
    process_crew(CharacterAtom, CrewAtom),
    nl,
    main_menu.
process_input(3) :-
    writeln('Enter the character name: '),
    read_line_to_codes(user_input, CharacterCodes),
    atom_codes(CharacterAtom, CharacterCodes),
    writeln('Enter the Devil Fruit name: '),
    read_line_to_codes(user_input, FruitCodes),
    atom_codes(FruitAtom, FruitCodes),
    process_fruit(CharacterAtom, FruitAtom),
    nl,
    main_menu.
process_input(4) :-
    writeln('Enter the crew name: '),
    read_line_to_codes(user_input, CrewCodes),
    atom_codes(CrewAtom, CrewCodes),
    process_show_characters_from_crew(CrewAtom),
    nl,
    main_menu.
process_input(5) :-
    writeln('Enter the character name: '),
    read_line_to_codes(user_input, CharacterCodes),
    atom_codes(CharacterAtom, CharacterCodes),
    process_get_crew(CharacterAtom),
    nl,
    main_menu.
process_input(6) :-
    writeln('Enter the character name: '),
    read_line_to_codes(user_input, CharacterCodes),
    atom_codes(CharacterAtom, CharacterCodes),
    process_get_role(CharacterAtom),
    nl,
    main_menu.
process_input(7) :-
    writeln('Enter the character name: '),
    read_line_to_codes(user_input, CharacterCodes),
    atom_codes(CharacterAtom, CharacterCodes),
    process_get_devil_fruit(CharacterAtom),
    nl,
    main_menu.
process_input(8) :-
    writeln('Enter the character name: '),
    read_line_to_codes(user_input, CharacterCodes),
    atom_codes(CharacterAtom, CharacterCodes),
    writeln('All information about the character:'),
    search_character_info(CharacterAtom),
    nl,
    main_menu.
process_input(9) :-
    writeln('Enter the role name (e.g., captain, sniper, doctor): '),
    read_line_to_codes(user_input, RoleCodes),
    atom_codes(RoleAtom, RoleCodes),
    find_characters_with_role(RoleAtom),
    nl,
    main_menu.
process_input(10) :-
    writeln('Exiting...').

% Predicate to process captain query
process_captain(Character) :-
    (is_captain(Character) -> writeln('Yes, the character is a captain.'); writeln('No, the character is not a captain.')).

% Predicate to process crew query
process_crew(Character, Crew) :-
    (is_from_crew(Character, Crew) -> writeln('Yes, the character is from the specified crew.'); writeln('No, the character is not from the specified crew.')).

% Predicate to process devil fruit query
process_fruit(Character, Fruit) :-
    (has_devil_fruit(Character, Fruit) -> writeln('Yes, the character has the specified Devil Fruit.'); writeln('No, the character does not have the specified Devil Fruit.')).

% Predicate to process showing characters from a crew query
process_show_characters_from_crew(Crew) :-
    writeln('Characters from the crew:'),
    show_characters_from_crew(Crew).

% Predicate to process getting the crew of a character
process_get_crew(Character) :-
    writeln('Crew of the character:'),
    get_crew(Character).

% Predicate to process getting the role of a character
process_get_role(Character) :-
    writeln('Role of the character:'),
    get_role(Character).

% Predicate to process getting the Devil Fruit of a character
process_get_devil_fruit(Character) :-
    writeln('Devil Fruit of the character:'),
    get_devil_fruit(Character).

% Predicate to find characters with a specific role
find_characters_with_role(Role) :-
    character(Character, Role, _, _),
    write(Character),
    nl,
    fail. % Backtrack to find more characters
find_characters_with_role(_). % End of search


% Predicate to search all information about a character
search_character_info(Character) :-
    character(Character, Role, Crew, DevilFruits),
    write('Name: '), writeln(Character),
    write('Role: '), writeln(Role),
    write('Crew: '), writeln(Crew),
    write('Devil Fruits: '), writeln(DevilFruits).

% Entry point
start :-
    main_menu.
