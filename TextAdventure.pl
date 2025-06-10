% Irena Sendler - The Rescuer of Warsaw
% A Text Adventure about a True Heroine

:- dynamic(current_chapter/1).
:- dynamic(network_intact/1).
:- dynamic(rescued_children_count/1).
:- dynamic(player_courage/1).

% Initialize game variables
init_game :-
    retractall(current_chapter(_)),
    retractall(network_intact(_)),
    retractall(rescued_children_count(_)),
    retractall(player_courage(_)),
    assertz(current_chapter(1)),
    assertz(network_intact(yes)),
    assertz(rescued_children_count(0)),
    assertz(player_courage(50)).

% Start game
start_game :-
    init_game,
    nl, nl,
    write('==============================================================================================================='), nl,
    print_intro_ascii_art,
    write('                                A Text Adventure about a True Heroine                                        '), nl,
    write('==============================================================================================================='), nl,
    nl,
    write('You are Irena Sendler, a Polish social worker in Warsaw.'), nl,
    write('The year is 1939. The world holds its breath as the shadows'), nl,
    write('of war descend upon Europe.'), nl,
    nl,
    write('The Nazis march in and begin the systematic persecution'), nl,
    write('of Jewish families.'), nl,
    nl,
    write('One day, you witness soldiers violently dragging a family'), nl,
    write('from their apartment. Their screams echo through the streets.'), nl,
    nl, nl,
    chapter1.

% CHAPTER 1: The War Begins (1939)
chapter1 :-
    nl,
    write('=== CHAPTER 1: THE WAR BEGINS ==='), nl,
    nl,
    write('The scene burns into your memory. Your heart pounds.'), nl,
    write('What do you do?'), nl,
    nl,
    write('1. Join the resistance'), nl,
    write('    You use your contacts to infiltrate secret networks'), nl,
    write('    and help.'), nl,
    nl,
    write('2. Hold back'), nl,
    write('    The danger is too great. You remain inconspicuous and'), nl,
    write('    try to protect your own life.'), nl,
    nl,
    write('3. Organize a public protest'), nl,
    write('    You risk everything to make a statement and'), nl,
    write('    mobilize others.'), nl,
    nl,
    read_choice(Choice),
    handle_chapter1_choice(Choice).

handle_chapter1_choice(1) :-
    nl,
    write('>> YOUR DECISION: Join the resistance <<'), nl,
    nl,
    write('A spark of resistance ignites within you.'), nl,
    write('You join the Polish underground and begin'), nl,
    write('to build secret networks.'), nl,
    write('This is the beginning of your dangerous mission.'), nl,
    nl, nl,
    gain_courage(10),
    set_chapter(2),
    chapter2.

handle_chapter1_choice(2) :-
    nl,
    write('>> YOUR DECISION: Hold back <<'), nl,
    nl,
    write('You held back. Fear was greater than'), nl,
    write('the desire to act.'), nl,
    write('Countless people die in the shadow of the occupation.'), nl,
    nl, nl,
    write('=== GAME OVER ==='), nl,
    write('The game ends here, a quiet elegy to unexercised courage.'), nl,
    game_over.

handle_chapter1_choice(3) :-
    nl,
    write('>> YOUR DECISION: Organize a public protest <<'), nl,
    nl,
    write('You organized a brave but desperate protest.'), nl,
    write('Although you mobilized others, you were immediately'), nl,
    write('arrested and taken away by the Gestapo.'), nl,
    write('Your story ends abruptly.'), nl,
    nl, nl,
    write('=== GAME OVER ==='), nl,
    game_over.

% CHAPTER 2: The First Rescues (1940-1942)
chapter2 :-
    nl,
    write('=== CHAPTER 2: THE FIRST RESCUE OPERATIONS ==='), nl,
    nl,
    write('The Warsaw Ghetto is established, a place of misery'), nl,
    write('and despair. Conditions are catastrophic:'), nl,
    write('overcrowding, hunger, and constant fear of death.'), nl,
    nl,
    write('As a social worker, you can officially enter the ghetto'), nl,
    write('and secretly smuggle out medicines, food, and even children'), nl,
    write('under the guise of hygiene inspections.'), nl,
    nl,
    write('One day, amidst the chaos, a desperate mother'), nl,
    write('begs you to rescue her small child from this inferno.'), nl,
    nl,
    write('How will you smuggle the child out of the ghetto?'), nl,
    nl,
    write('1. Use the sewers'), nl,
    write('    Quick and inconspicuous, but extremely risky'), nl,
    write('    and dangerous for the child.'), nl,
    nl,
    write('2. Ambulance hiding spot'), nl,
    write('    Safer and less conspicuous, but slower'), nl,
    write('    and requires a lot of planning.'), nl,
    nl,
    write('3. Bribery'), nl,
    write('    Unpredictable. Some guards are corruptible,'), nl,
    write('    others are not. A gamble with life and death.'), nl,
    nl,
    read_choice(Choice),
    handle_chapter2_choice(Choice).

handle_chapter2_choice(1) :-
    nl,
    write('>> YOUR DECISION: Use the sewers <<'), nl,
    nl,
    write('You choose the dangerous path through'), nl,
    write('the sewers. Every shadow is a potential danger.'), nl,
    write('But you make it! The child is safe.'), nl,
    nl, nl,
    increase_rescued_children(1),
    gain_courage(5),
    set_chapter(3),
    chapter3.

handle_chapter2_choice(2) :-
    nl,
    write('>> YOUR DECISION: Ambulance hiding spot <<'), nl,
    nl,
    write('You arrange a hiding spot in an ambulance.'), nl,
    write('It is a slow, nerve-wracking process,'), nl,
    write('but the disguise is perfect. Another child is saved!'), nl,
    nl, nl,
    increase_rescued_children(1),
    gain_courage(5),
    set_chapter(3),
    chapter3.

handle_chapter2_choice(3) :-
    nl,
    write('>> YOUR DECISION: Bribery <<'), nl,
    nl,
    write('You try to bribe a guard. You hold your breath...'), nl,
    write('But the guard is incorruptible and looks at you suspiciously.'), nl,
    write('You must act quickly to avoid drawing attention to yourself.'), nl,
    write('The child could not be saved.'), nl,
    nl, nl,
    lose_courage(5),
    set_chapter(3),
    chapter3.

% CHAPTER 3: Danger and Discovery (1943)
chapter3 :-
    nl,
    write('=== CHAPTER 3: DANGER AND DISCOVERY ==='), nl,
    nl,
    write('Your work continues, but danger lurks everywhere.'), nl,
    nl,
    write('One day, during a seemingly routine inspection,'), nl,
    write('the Gestapo discovers fake papers in your bag!'), nl,
    write('Your heart sinks.'), nl,
    nl,
    write('What do you do in this critical situation?'), nl,
    nl,
    write('1. Remain steadfast'), nl,
    write('    You maintain your composure and refuse'), nl,
    write('    to give any names. You risk arrest.'), nl,
    nl,
    write('2. Deceive'), nl,
    write('    You try to deceive the Gestapo with a clever'), nl,
    write('    lie or a distraction.'), nl,
    nl,
    write('3. Flee'), nl,
    write('    An impulsive attempt that could save you if successful,'), nl,
    write('    but means certain doom if it fails.'), nl,
    nl,
    read_choice(Choice),
    handle_chapter3_choice(Choice).

handle_chapter3_choice(1) :-
    nl,
    write('>> YOUR DECISION: Remain steadfast <<'), nl,
    nl,
    write('You remain steadfast. The Gestapo is impressed by'), nl,
    write('your determination, but they will not release you.'), nl,
    write('You are arrested, but your precious network remains intact.'), nl,
    nl, nl,
    retractall(network_intact(_)),
    assertz(network_intact(yes)),
    gain_courage(15),
    set_chapter(4),
    chapter4.

handle_chapter3_choice(2) :-
    nl,
    write('>> YOUR DECISION: Deceive <<'), nl,
    nl,
    write('You try to deceive the Gestapo. It is a risky game...'), nl,
    write('You buy yourself a moment, but the experienced'), nl,
    write('investigators see through your trick. You are arrested.'), nl,
    nl, nl,
    retractall(network_intact(_)),
    assertz(network_intact(yes)),
    lose_courage(10),
    set_chapter(4),
    chapter4.

handle_chapter3_choice(3) :-
    nl,
    write('>> YOUR DECISION: Flee <<'), nl,
    nl,
    (random_event_success(60) ->
        (write('You seize a favorable moment and escape!'), nl,
         write('The Gestapo is surprised, and you manage to get away.'), nl,
         write('An enormous risk that paid off!'), nl,
         nl, nl,
         write('You are now a fleeting ghost, but you can'), nl,
         write('go into hiding and continue to rescue children.'), nl,
         nl, nl,
         increase_rescued_children(5),
         gain_courage(20),
         set_chapter(5),
         chapter5)
    ;
        (write('Your escape attempt fails. The Gestapo is faster'), nl,
         write('and overwhelms you. You are immediately arrested.'), nl,
         write('Your network is in danger.'), nl,
         nl, nl,
         lose_courage(20),
         set_chapter(4),
         chapter4)
    ).

% CHAPTER 4: Captured by the Gestapo (1943)
chapter4 :-
    nl,
    write('=== CHAPTER 4: CAPTURED BY THE GESTAPO ==='), nl,
    nl,
    write('You are taken to the infamous Pawiak Prison,'), nl,
    write('a place of fear and torture.'), nl,
    write('The interrogations begin, and they demand names from you.'), nl,
    nl,
    write('What do you do to protect your network and yourself?'), nl,
    nl,
    write('1. Remain silent'), nl,
    write('    You endure the torture to protect your valuable'), nl,
    write('    network.'), nl,
    nl,
    write('2. Give false names'), nl,
    write('    You invent names and places to buy time'), nl,
    write('    and mislead the Gestapo.'), nl,
    nl,
    write('3. Betray'), nl,
    write('    The pressure is too great. You reveal information'), nl,
    write('    and thus destroy what you fought for.'), nl,
    nl,
    read_choice(Choice),
    handle_chapter4_choice(Choice).

handle_chapter4_choice(1) :-
    nl,
    write('>> YOUR DECISION: Remain silent <<'), nl,
    nl,
    write('You remain silent despite the unbearable pain.'), nl,
    write('Your iron will protects your network.'), nl,
    write('They cannot extract any names from you.'), nl,
    nl, nl,
    retractall(network_intact(_)),
    assertz(network_intact(yes)),
    gain_courage(25),
    set_chapter(5),
    chapter5.

handle_chapter4_choice(2) :-
    nl,
    write('>> YOUR DECISION: Give false names <<'), nl,
    nl,
    write('You give false names and invented stories.'), nl,
    write('It is a risky game, but it buys you time.'), nl,
    write('The Gestapo will soon realize this, but your network'), nl,
    write('may still be able to adapt.'), nl,
    nl, nl,
    retractall(network_intact(_)),
    assertz(network_intact(yes)),
    gain_courage(10),
    set_chapter(5),
    chapter5.

handle_chapter4_choice(3) :-
    nl,
    write('>> YOUR DECISION: Betray <<'), nl,
    nl,
    write('The pressure is too great. You betray parts of your network.'), nl,
    write('The consequences are devastating: your network is destroyed,'), nl,
    write('countless people die.'), nl,
    nl, nl,
    write('=== GAME OVER ==='), nl,
    write('The game ends here in despair and defeat.'), nl,
    nl,
    retractall(network_intact(_)),
    assertz(network_intact(no)),
    game_over.

% CHAPTER 5: The Escape (1943-1944)
chapter5 :-
    (network_intact(yes) ->
        chapter5_liberation
    ;
        chapter5_failed
    ).

chapter5_liberation :-
    nl,
    write('=== CHAPTER 5: THE ESCAPE ==='), nl,
    nl,
    write('Against all odds, your loyal resistance network'), nl,
    write('succeeds in freeing you from prison!'), nl,
    write('A triumphant moment, but the danger is not yet over.'), nl,
    nl,
    write('You are free, but hunted. What will you do next?'), nl,
    nl,
    write('1. Continue'), nl,
    write('    You continue your dangerous work to rescue more'), nl,
    write('    children, although the risk is enormously increased.'), nl,
    nl,
    write('2. Flee abroad'), nl,
    write('    You seek safety abroad, knowing that your'), nl,
    write('    direct influence on rescue operations will be limited.'), nl,
    nl,
    write('3. Assume a new identity'), nl,
    write('    You go into hiding and assume a new identity'), nl,
    write('    to protect yourself.'), nl,
    nl,
    read_choice(Choice),
    handle_chapter5_choice(Choice).

chapter5_failed :-
    nl,
    write('=== CHAPTER 5: THE END ==='), nl,
    nl,
    write('Your network was destroyed. There is no one left'), nl,
    write('who could help you. You remain in prison.'), nl,
    nl, nl,
    write('=== GAME OVER ==='), nl,
    game_over.

handle_chapter5_choice(1) :-
    nl,
    write('>> YOUR DECISION: Continue <<'), nl,
    nl,
    write('You decide to continue your dangerous and life-saving'), nl,
    write('work. You become a shadow heroine,'), nl,
    write('acting in secret and saving countless lives.'), nl,
    nl, nl,
    increase_rescued_children(15),
    gain_courage(20),
    set_chapter(6),
    chapter6.

handle_chapter5_choice(2) :-
    nl,
    write('>> YOUR DECISION: Flee abroad <<'), nl,
    nl,
    write('You flee abroad to be safe.'), nl,
    write('Rescue operations in Warsaw continue without your'), nl,
    write('direct involvement. Your influence is now rather indirect.'), nl,
    nl, nl,
    set_chapter(7),
    chapter7.

handle_chapter5_choice(3) :-
    nl,
    write('>> YOUR DECISION: Assume a new identity <<'), nl,
    nl,
    write('You assume a new identity to protect yourself.'), nl,
    write('It is a lonely path, and communication with'), nl,
    write('your network becomes difficult.'), nl,
    write('But your survival might ensure future indirect help.'), nl,
    nl, nl,
    set_chapter(6),
    chapter6.

% CHAPTER 6: Post-War Period (1945)
chapter6 :-
    nl,
    write('=== CHAPTER 6: POST-WAR PERIOD ==='), nl,
    nl,
    write('The war is finally over! Liberation has arrived,'), nl,
    write('but the scars remain.'), nl,
    write('Thousands of children you rescued must now'), nl,
    write('find their families.'), nl,
    nl,
    write('This reunification is a delicate and emotional process.'), nl,
    write('How will you proceed?'), nl,
    nl,
    write('1. Immediately pass on information'), nl,
    write('    A quick action, but also a great'), nl,
    write('    risk of data misuse.'), nl,
    nl,
    write('2. Wait for secured channels'), nl,
    write('    Slower and more patient, but a safer'), nl,
    write('    process for the children and their families.'), nl,
    nl,
    write('3. Involve international organizations'), nl,
    write('    A bureaucratic, but stable way to'), nl,
    write('    ensure long-term support.'), nl,
    nl,
    read_choice(Choice),
    handle_chapter6_choice(Choice).

handle_chapter6_choice(1) :-
    nl,
    write('>> YOUR DECISION: Immediately pass on information <<'), nl,
    nl,
    write('You immediately pass on the information to help the children'), nl,
    write('as quickly as possible. Many families are quickly reunited,'), nl,
    write('but there are also some cases of data misuse.'), nl,
    nl, nl,
    set_chapter(7),
    chapter7.

handle_chapter6_choice(2) :-
    nl,
    write('>> YOUR DECISION: Wait for secured channels <<'), nl,
    nl,
    write('You wait for secured channels and careful verification.'), nl,
    write('The process is slower, but the reunification'), nl,
    write('is safer and protects the children better.'), nl,
    nl, nl,
    set_chapter(7),
    chapter7.

handle_chapter6_choice(3) :-
    nl,
    write('>> YOUR DECISION: Involve international organizations <<'), nl,
    nl,
    write('You involve international organizations.'), nl,
    write('It is a bureaucratic path that takes time,'), nl,
    write('but it ensures stable and long-term'), nl,
    write('solutions for the children''s future.'), nl,
    nl, nl,
    set_chapter(7),
    chapter7.

% CHAPTER 7: Later Years - Fame or Oblivion?
chapter7 :-
    nl,
    write('=== CHAPTER 7: LATER YEARS ==='), nl,
    nl,
    write('The world gradually learns of your incredible heroic deeds.'), nl,
    write('Your name, Irena Sendler, becomes a symbol of courage and humanity.'), nl,
    nl,
    write('How will you deal with this attention?'), nl,
    nl,
    write('1. Speak publicly'), nl,
    write('    You step into the spotlight to share your story'), nl,
    write('    and inspire others.'), nl,
    nl,
    write('2. Remain in the background'), nl,
    write('    You prefer peace and remain unknown,'), nl,
    write('    even if you receive less recognition for it.'), nl,
    nl,
    write('3. Pass on history to descendants'), nl,
    write('    You ensure that your experiences are passed on to'), nl,
    write('    future generations.'), nl,
    nl,
    read_choice(Choice),
    handle_chapter7_choice(Choice).

handle_chapter7_choice(1) :-
    nl,
    write('>> YOUR DECISION: Speak publicly <<'), nl,
    nl,
    write('You appear publicly and share your story with the world.'), nl,
    write('You inspire countless people and ensure that'), nl,
    write('the horrors of the past are never forgotten.'), nl,
    nl, nl,
    show_final_stats,
    write('Your story and the rescued children are a'), nl,
    write('shining example of humanity.'), nl,
    nl, nl,
    game_completed.

handle_chapter7_choice(2) :-
    nl,
    write('>> YOUR DECISION: Remain in the background <<'), nl,
    nl,
    write('You remain in the background, a silent hero.'), nl,
    write('Your safety is ensured, but your deeds'), nl,
    write('remain less known. But you know what you have done.'), nl,
    nl, nl,
    show_final_stats,
    write('Your actions, whether known or unknown, have changed the world.'), nl,
    nl, nl,
    game_completed.

handle_chapter7_choice(3) :-
    nl,
    write('>> YOUR DECISION: Pass on history to descendants <<'), nl,
    nl,
    write('You dedicate yourself to passing on your story to'), nl,
    write('future generations, through books, lectures'), nl,
    write('or personal narratives.'), nl,
    write('Your influence is secured long-term.'), nl,
    nl, nl,
    show_final_stats,
    write('Through your efforts, the stories'), nl,
    write('of the rescued children and your own will never'), nl,
    write('be forgotten.'), nl,
    nl, nl,
    game_completed.

% HELPER PREDICATES

set_chapter(Chapter) :-
    retractall(current_chapter(_)),
    assertz(current_chapter(Chapter)).

increase_rescued_children(Amount) :-
    get_rescued_children_count(CurrentCount),
    NewCount is CurrentCount + Amount,
    retractall(rescued_children_count(_)),
    assertz(rescued_children_count(NewCount)).

get_rescued_children_count(Count) :-
    (rescued_children_count(Count) -> true ; Count = 0).

gain_courage(Amount) :-
    player_courage(CurrentCourage),
    NewCourage is min(100, CurrentCourage + Amount),
    retractall(player_courage(_)),
    assertz(player_courage(NewCourage)),
    format('>> Your courage has increased (+~w)! Current courage: ~w/100 <<~n', [Amount, NewCourage]).

lose_courage(Amount) :-
    player_courage(CurrentCourage),
    NewCourage is max(0, CurrentCourage - Amount),
    retractall(player_courage(_)),
    assertz(player_courage(NewCourage)),
    format('>> Your courage has decreased (-~w)! Current courage: ~w/100 <<~n', [Amount, NewCourage]).

random_event_success(Chance) :-
    random(0, 100, Roll),
    Roll < Chance.

read_choice(Choice) :-
    write('>> Your choice (1, 2 or 3): '),
    flush_output,
    read(Input),
    (   (Input = 1; Input = 2; Input = 3) ->
        Choice = Input
    ;   nl,
        write('>> Invalid input! Please enter 1, 2 or 3. <<'), nl,
        read_choice(Choice)
    ).

show_final_stats :-
    get_rescued_children_count(Count),
    player_courage(Courage),
    write('=== YOUR FINAL STATISTICS ==='), nl,
    format('Children rescued: ~w~n', [2500]),
    format('Final courage: ~w/100~n', [Courage]),
    nl.

game_completed :-
    write('==================================================='), nl,
    write('    Thank you for playing this game about Irena Sendler!'), nl,
    write('    Your decisions shaped the course of this'), nl,
    write('    historical story.'), nl,
    write('==================================================='), nl,
    nl, nl,
    write('The game is now over. You can restart it anytime'), nl,
    write('to try different decisions.'), nl,
    nl, nl.

game_over :-
    nl,
    write('======================================================'), nl,
    write('    The game is over. Your journey as Irena Sendler'), nl,
    write('    ends here. But the story continues -'), nl,
    write('    perhaps you would like to try again?'), nl,
    write('==================================================='), nl,
    nl, nl.

print_intro_ascii_art :-
    write(' ___   ______    _______  __    _  _______    _______  _______  __    _  ______   ___      _______  ______   '), nl,
    write('|   | |    _ |  |       ||  |  | ||   _   |  |       ||       ||  |  | ||      | |   |    |       ||    _ |  '), nl,
    write('|   | |   | ||  |    ___||   |_| ||  |_|  |  |  _____||    ___||   |_| ||  _    ||   |    |    ___||   | ||  '), nl,
    write('|   | |   |_||_ |   |___ |       ||       |  | |_____ |   |___ |       || | |   ||   |    |   |___ |   |_||_ '), nl,
    write('|   | |    __  ||    ___||  _    ||       |  |_____  ||    ___||  _    || |_|   ||   |___ |    ___||    __  |'), nl,
    write('|   | |   |  | ||   |___ | | |   ||   _   |   _____| ||   |___ | | |   ||       ||       ||   |___ |   |  | |'), nl,
    write('|___| |___|  |_||_______||_|  |__||__| |__|  |_______||_______||_|  |__||______| |_______||_______||___|  |_|'), nl, nl.