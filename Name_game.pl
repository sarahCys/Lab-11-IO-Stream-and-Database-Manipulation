
% Name Game

:- dynamic letter/1.

% Starting letters
start :-
    retractall(letter(_)),
    assertz(letter(a)),
    assertz(letter(b)),
    assertz(letter(c)),
    menu.

% Display menu
menu :-
    nl,
    write('Hi. This is the "Name Game"'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name'), nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice: '),
    read(Choice),
    action(Choice).

% Display letters
action(1) :-
    listing(letter/1),
    menu.

% Add a letter
action(2) :-
    write('Enter a letter: '),
    read(Letter),
    assertz(letter(Letter)),
    menu.

% Add at the top
action(3) :-
    write('Enter a letter: '),
    read(Letter),
    asserta(letter(Letter)),
    menu.

% Add at the bottom
action(4) :-
    write('Enter a letter: '),
    read(Letter),
    assertz(letter(Letter)),
    menu.

% Delete one letter
action(5) :-
    write('Enter a letter to delete: '),
    read(Letter),
    ( retract(letter(Letter)) ->
        write('Letter deleted'), nl
    ;
        write('Letter not found'), nl
    ),
    menu.

% Delete all letters
action(6) :-
    retractall(letter(_)),
    write('All letters deleted'), nl,
    menu.

% Exit
action(7) :-
    !,
    write('Goodbye!'), nl.

% Invalid choice
action(_) :-
    write('Invalid choice'), nl,
    menu.
