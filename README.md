# Analiza podatkov s programom R, 2014/15

Avtor: Anja Skube

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2014/15.

## Tematika

V projektu bom analizirala 50 najbolj prodajanih knjig vseh časov na svetu. Primerjala bom knjige po žanru, ceni, spolu pisatelja, številu strani in številu prodanih izvodov.  
Podatke za moj projekt sem dobila na Wikipediji in ostalih spletnih straneh.

Povezava do podatkovne tabele:
http://en.wikipedia.org/wiki/List_of_best-selling_books

Cilj projekta je, da primerjam število prodanih knjig po cenah ter katera zvrst prevladuje. 

## Program

Glavni program se nahaja v datoteki `projekt.r`. Ko ga poženemo, se izvedejo
programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Slike, ki jih program naredi, se shranijo v mapo
`slike/`. Zemljevidi v obliki SHP, ki jih program pobere, se shranijo v mapo
`zemljevid/`.

## Poročilo

Poročilo se nahaja v mapi `porocilo/`. Za izdelavo poročila v obliki PDF je
potrebno datoteko `porocilo/porocilo.tex` prevesti z LaTeXom. Pred tem je
potrebno pognati program, saj so v poročilu vključene slike iz mape `slike/`.
