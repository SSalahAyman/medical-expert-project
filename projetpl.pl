/*medical expert project*/
go:-
supposition(_),
nl,
write('Take care of yourself '),

undo.
/*supposition that should be tested*/
supposition(diabetes) :- diabetes, !.
supposition(anemia)   :- anemia, !.
supposition(measles)  :- measles, !.
supposition(malaria)  :- malaria, !.
supposition(not_sick)  :- not_sick, !.

/*supposition Identification Rules*/
/*diabetes*/
diabetes :-
prove(feeling_thirsty),
prove(fatigue),
prove(blurred_vision),
prove(weight_loss),

write('you have  '),
write(diabetes),
nl,
nl,
write('follow these medicinals:'),
nl,
write('Canagliflozin'),
nl,
write('Glimepiride '),
nl,
write('Pravastatin '),
nl,
nl,
write('Advice:'),
nl,
write('Do 30 minutes of exercise at least five times a week'),
nl.
/*anemia*/
anemia :-
prove(weakness),
prove(shortness_of_breath),
prove(headache),
prove(cold_hands_and_feet),

write('you have  '),
write(anemia),
nl,
nl,
write('follow these medicinals:'),
nl,
write('Vitamin B-12 '),
nl,
write('Vitamin B-9'),
nl,
write('Vitamin C'),
nl,
nl,
write('Advice:'),
nl,
write('Eat plenty of vegetables, fruits and meat'),
nl.
/*measles*/
measles :-
prove(fever),
prove(runny_nose),
prove(rash),
prove(conjunctivitis),

write('you have  '),
write(measles),
nl,
nl,
write('follow these medicinals:'),
nl,
write('Tylenol'),
nl,
write('Aleve'),
nl,
write('Advil'),
nl,
write(' Vitamin A'),
nl,
nl,
write('Advice:'),
nl,
write('Please Get rest and use more liquid  Because'),
nl.
 /*malaria*/
malaria :-
prove(rise_in_temperature),
prove(heavy_sweating),
prove(nausea_and_vomiting),
prove(diarrhea),
write('you have  '),
write(malaria),
nl,
nl,
write('follow these medicinals:'),
nl,
write('chloroquine'),
nl,
write('Hydroxy '),
nl,
write('mefloquine'),
nl,
write('Quinine_sulfite'),
nl,
nl,
write('Advice:'),
nl,
write('Focus on taking antipyretics, and making cold water compresses constantly.'),
nl.

not_sick :-
write('dont wory you are not_sick:')   .

/* how to do questions */
what(Question) :-
write('Does the patient have that symptom !?'),
write(Question),
write('  '),
read(Response),
nl,
( (Response == yes ; Response == y)
->
assert(yes(Question)) ;
assert(no(Question)), fail).
:- dynamic yes/1,no/1.
/*How to prove something */
prove(S) :-
 (yes(S)
  ->
   true ;
 (no(S)
  ->
   fail ;
 what(S))).

undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
