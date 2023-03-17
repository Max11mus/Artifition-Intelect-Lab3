% Facts
male(max_max).
male(ivan_max).
male(petro_max).
male(leon_olex).
male(serhiy_leon).
male(max_petro).

female(natali_olex).
female(alla_vasil).
female(lilia_leon).
female(yulia_petro).

parent(max_max, ivan_max).
parent(max_max, petro_max).
parent(natali_olex, ivan_max).
parent(natali_olex, petro_max).

parent(leon_olex, lilia_leon).
parent(leon_olex, serhiy_leon).
parent(alla_vasil, lilia_leon).
parent(alla_vasil, serhiy_leon).

parent(petro_max, max_petro).
parent(petro_max, yulia_petro).
parent(lilia_leon, max_petro).
parent(lilia_leon, yulia_petro).

% Rules
father(Parent, Child) :- parent(Parent, Child), male(Parent).
mother(Parent, Child) :- parent(Parent, Child), female(Parent).

child(Child, Parent) :- parent(Parent, Child).
son(Child,Parent) :- child(Child, Parent), male(Child).
daugther(Child,Parent) :- child(Child, Parent), female(Child).

grandfather(GrandParent, Child) :- parent(GrandParent, Parent), parent(Parent, Child), male(GrandParent).
grandmother(GrandParent, Child) :- parent(GrandParent, Parent), parent(Parent, Child), female(GrandParent).
grandson(Child, GrandParent) :- parent(GrandParent, Parent), parent(Parent, Child), male(Child).
granddaugther(Child, GrandParent) :- parent(GrandParent, Parent), parent(Parent, Child), female(Child).

sister(Child,X) :- parent(XParent, X), parent(Parent, Child), male(Child), XParent=Parent, not(Child = X).
brother(Child,X) :- parent(XParent, X), parent(Parent, Child), female(Child), XParent=Parent, not(Child = X).

uncle(Uncle,X) :- parent(XParent, X), parent(XGrandParent, XParent), parent(GrandParent, Uncle), male(Uncle), XGrandParent=GrandParent, not(Uncle=XParent).
aunt(Aunt,X) :- parent(XParent, X), parent(XGrandParent, XParent), parent(GrandParent, Aunt), female(Aunt), XGrandParent=GrandParent, not(Aunt=XParent).
