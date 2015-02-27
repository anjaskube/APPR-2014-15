# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
#uvoziKnjige <- function() {
# return(read.csv2("podatki/anpppodatki.csv", sep = ";", as.is = TRUE,
#                      row.names = 1,
#                      col.names = c("Naslov", "Pisatelj", "Jezik izvirnika", "Leto izdaje", "Prodaja","Spol","Vrsta","Film","St. knjig na pisatelja"),
#                      fileEncoding = "Windows-1250"))
#}

uvoziKnjige <- function(){
  return(read.csv2(file="podatki/anpppodatki.csv", header=TRUE, sep=";", fileEncoding="Windows-1250", row.names=1))
}

uvozitabela4 <- function(){
  return(read.csv2(file="podatki/tabela2014.csv", header=TRUE, sep=";", fileEncoding="Windows-1250", row.names=1))
}

uvozitabela3 <- function(){
  return(read.csv2(file="podatki/tabela2013.csv", header=TRUE, sep=";", fileEncoding="Windows-1250", row.names=1))
}

uvozitabela2 <- function(){
  return(read.csv2(file="podatki/tabela2012.csv", header=TRUE, sep=";", fileEncoding="Windows-1250", row.names=1))
}

uvozitabela1 <- function(){
  return(read.csv2(file="podatki/tabela2011.csv", header=TRUE, sep=";", fileEncoding="Windows-1250", row.names=1))
}

# Zapišimo podatke v razpredelnico knjige.
cat("Uvažam podatke o knjigah...\n")
knjige <- uvoziKnjige()

Drzava<-c("England","England","France","England","United States","China","England","England","Northern Ireland","United States","United States","England","United States","Brazil","England","England","England","England","England","Spain","Russian Federation","Germany","United States","Canada","England","Italy","England","England","Germany","United States","Ireland","United States","England","United States","United States","Norway","United States","United States","Russian Federation","Russian Federation","Italy","United States","United States","United States","England","United States","United States","United States","United States","Netherlands","United States","Australia","United States","Sweden","United States")
dodatenstolpec<-data.frame(Drzava)


KNJIGE<-data.frame(knjige,Drzava)
Tabela2014 <- uvozitabela4()
Tabela2013 <- uvozitabela3()
Tabela2012 <- uvozitabela2()
Tabela2011 <- uvozitabela1()


# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.





