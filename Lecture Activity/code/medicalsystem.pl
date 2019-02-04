% FACTS (things that we know)

% Diseases
disease(strep_throat).
disease(psoriasis).
disease(cold).


% Drugs
drug(amoxicillin).
drug(penicillin_v).
drug(paracetamol).
drug(ibuprofen).
drug(clobetasol).


% Symptoms: given a disease, what are the related of symptoms
symptom( strep_throat,	[fever,sore_throat,tonsils_pus,swollen_glands] ).
symptom( psoriasis,	[scaly_skin,dry_skin,itchiness] ).
symptom( cold,			[fever,sore_throat,cough,runny_nose] ).


% Drug treats diseases: given a drug, what are the diseases it treats
treats(	amoxicillin,	[strep_throat,pneumonia,salmonella] ).
treats(	penicillin_v,	[strep_throat,tonsillitis,anthrax] ).
treats(	ibuprofen,		[cold,headache,toothache,fever,arthritis] ).
treats(	paracetamol,	[headache,cold,migraine] ).
treats(	clobetasol,		[psoriasis,eczema,vitiligo] ).


% RULES (things that the program don't know but can infer)

% TODO
% Similar diseases: given 2 diseases, return true if they have at least 1 common symptom
similar(A,B):-
	disease(A), % ensure A is a disease
	disease(B), % ensure B is a disease
	A \== B,    % ensure A and B are not the same disease
	symptom(A, L1), % get list of symptoms for disease A
	symptom(B, L2), % get list of symptoms for disease B
	common_part(L1,L2). % find out what are the common symptom 


% Disease treatments: given a disease, what drugs can be prescribed
disease_treatment(M,L):-
    disease(M),
    treatment(M,L,[]).

treatment(M,[R|L],L_Treat):-
    treats(R,T),
    is_element(M,T),
    not_in(R,L_Treat),
    treatment(M,L,[R|L_Treat]), !.

treatment(_,[],L_Treat):-
    L_Treat\==[].


not_in(_,[]).
not_in(E,[X|L]):-
    E\==X,
    not_in(E,L).
	
	
% Given two lists, return true if there is at least 1 item that appears in both lists
common_part([S1|_],L2):-
    is_element(S1,L2), !.
common_part([_|L1],L2):-
    is_element(L1,L2).

is_element(E,[E|_]).
is_element(E,[_|L]):-
    is_element(E,L).

