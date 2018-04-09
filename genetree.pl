homem(antonio).
homem(nelson).
homem(claudio).
homem(mauricio).
homem(jorge).
homem(bruno).
homem(broderio).
homem(rodrigo).
homem(vitor).
homem(lucio).
homem(amon).
homem(amarth).
mulher(zila).
mulher(cassilha).
mulher(noemi).
mulher(adriane).
mulher(rosangela).
mulher(celia).
mulher(michele).
mulher(joana).
mulher(hebe).
mulher(fer).
casado(antonio, zila).
casado(nelson, cassilha).
casado(claudio, noemi).
casado(adriane, mauricio).
casado(celia, jorge).
casado(joana, bruno).
casado(broderio, hebe).
progenitor(antonio, noemi).
progenitor(zila, noemi).
progenitor(antonio, adriane).
progenitor(zila, adriane).
progenitor(nelson, mauricio).
progenitor(nelson, rosangela).
progenitor(nelson, celia).
progenitor(cassilha, mauricio).
progenitor(cassilha, rosangela).
progenitor(cassilha, celia).
progenitor(claudio, michele).
progenitor(noemi, michele).
progenitor(adriane, bruno).
progenitor(mauricio, bruno).
progenitor(adriane, broderio).
progenitor(mauricio, broderio).
progenitor(celia, rodrigo).
progenitor(jorge, rodrigo).
progenitor(michele, vitor).
progenitor(joana, lucio).
progenitor(joana, fer).
progenitor(bruno, lucio).
progenitor(bruno, fer).
progenitor(broderio, amon).
progenitor(broderio, amarth).
progenitor(hebe, amon).
progenitor(hebe, amarth).

%---REGRAS---%
pai(X, Y) :- progenitor(X, Y),homem(X).
mae(X, Y) :- progenitor(X, Y),mulher(X).
avo_paterna(X, Z) :- mae(X,Y),pai(Y, Z),mulher(X).
irmaos(X, Y) :- (pai(Z, X), pai(Z, Y), (X\=Y)).
irmao(X, Y) :- pai(Z, X), pai(Z, Y), mae(J, X), mae(J, Y), (X\=Y), homem(X),homem(Y).
irmaos_completos(X, Y) :- pai(Z, X), pai(Z, Y), mae(J, X), mae(J, Y), (X\=Y).
sogro(X, Y) :- casado(Y, Z), homem(X), pai(X, Z).
tio(X, Y) :- homem(X),(pai(Z, Y);mae(Z, Y)),irmaos(X, Z).
neto(X, Y) :- progenitor(Z, X), progenitor(Y, Z).
antepassado(X,Y):- progenitor(X,Y).
antepassado(Z, W):- progenitor(Z,X), antepassado(X,W).


