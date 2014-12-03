# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
#uvoziKnjige <- function() {
# return(read.table("podatki/anpppodatki.csv", sep = ";", as.is = TRUE,
#                      row.names = 1,
#                      col.names = c("Naslov", "Pisatelj", "Jezik izvirnika", "Leto izdaje", "Prodaja","Spol","Vrsta","Film","St. knjig na pisatelja"),
#                      fileEncoding = "Windows-1250"))
#}

uvoziKnjige <- function(){
  return(read.csv2(file="podatki/anpppodatki.csv", header=TRUE, sep=";"))
}


# Zapišimo podatke v razpredelnico knjige.
cat("Uvažam podatke o knjigah...\n")
knjige <- uvoziKnjige()

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.