# # 4. faza: Analiza podatkov
# 
# # Uvozimo funkcijo za uvoz spletne strani.
# source("lib/xml.r")
# 
# # Preberemo spletno stran v razpredelnico.
# cat("Uvažam spletno stran...\n")
# tabela <- preuredi(uvozi.obcine(), obcine)
# 
# # Narišemo graf v datoteko PDF.
# cat("Rišem graf...\n")
# pdf("slike/naselja.pdf", width=6, height=4)
# plot(tabela[[1]], tabela[[4]],
#      main = "Število naselij glede na površino občine",
#      xlab = "Površina (km^2)",
#      ylab = "Št. naselij")
# dev.off()



# spremembe v snemanju filmov po knjigah v zadnjih štirih letih

pdf("slike/Film1.pdf",paper="a4")
film1<-table(Tabela2011$Film)
f1<-c(film1)
barplot(f1, names.arg = c("DA", "NE"), xlab="POSNET FILM- DA/NE", ylab="ŠTEVILO", main= 'ŠTEVILO KNJIG, PO KATERIH SO POSNELI FILM', las=2, cex.names=0.75, col="blue")
dev.off()


pdf("slike/Film2.pdf",paper="a4")
film2<-table(Tabela2012$Film)
f2<-c(film2)
barplot(f2, names.arg = c("DA", "NE"), xlab="POSNET FILM- DA/NE", ylab="ŠTEVILO", main= 'ŠTEVILO KNJIG, PO KATERIH SO POSNELI FILM', las=2, cex.names=0.75, col="blue")
dev.off()


pdf("slike/Film3.pdf",paper="a4")
film3<-table(Tabela2013$Film)
f3<-c(film3)
barplot(f3, names.arg = c("DA", "NE"), xlab="POSNET FILM- DA/NE", ylab="ŠTEVILO", main= 'ŠTEVILO KNJIG, PO KATERIH SO POSNELI FILM', las=2, cex.names=0.75, col="blue")
dev.off()


pdf("slike/Film4.pdf",paper="a4")
film4<-table(Tabela2014$Film)
f4<-c(film4)
barplot(f4, names.arg = c("DA", "NE"), xlab="POSNET FILM- DA/NE", ylab="ŠTEVILO", main= 'ŠTEVILO KNJIG, PO KATERIH SO POSNELI FILM', las=2, cex.names=0.75, col="blue")
dev.off()




#povprečje strani v knjigah za vsako leto
strani4 <- sum(Tabela2014$Strani)
povp4<-strani4/10

strani3 <- sum(Tabela2013$Strani)
povp3<-strani3/10

strani2 <- sum(Tabela2012$Strani)
povp2<-strani2/10

strani1 <- sum(Tabela2011$Strani)
povp1<-strani1/10


pdf("slike/povprecnestrani.pdf",paper="a4")
povp <- c(povp1, povp2, povp3, povp4)
barplot(povp, names.arg = c("2011", "2012", "2013", "2014"), xlab="LETA", ylab="ŠTEVILO STRANI", main= 'POVPREČNO ŠTEVILO STRANI PO KNJIGAH', las=2, cex.names=0.75, col="blue")
dev.off()



#povprečje ocen za knjige po letih

ocena1 <- sum(Tabela2014$Ocena)
po1<-ocena1/10
 
ocena2 <- sum(Tabela2012$Ocena)
po2<-ocena2/10

ocena3 <- sum(Tabela2013$Ocena)
po3<-ocena3/10

ocena4 <- sum(Tabela2014$Ocena)
po4<-ocena4/10


pdf("slike/povprecneocene.pdf",paper="a4")
po <- c(po1, po2, po3, po4)
barplot(po, names.arg = c("2011", "2012", "2013", "2014"), xlab="LETA", ylab="OCENA", main= 'POVPREČNA OCENA KNJIG PO LETIH', las=2, cex.names=0.75, col="blue")
dev.off()


# Najprej je treba naloziti paketa za delo z zemljevidi.
library(sp)
library(maptools)
library(rgeos)
gpclibPermit()

source("lib/uvozi.zemljevid.r")
pdf("slike/drzave_zda.pdf")

USA <- uvozi.zemljevid("http://audrey.fmf.uni-lj.si/states_21basic.zip", "USA", "states.shp", mapa = "zemljevid")

nocemo <- c("Alaska", "Hawaii", "Puerto Rico", "U.S. Virgin Islands")
states <- USA[!(USA$STATE_NAME %in% nocemo),]

#zemljevid2011
drzave1 <- table(Tabela2011$Država)
imenadrzav1<-names(drzave1)
stevilo1 <- unique(drzave1)
stevilo1 <- stevilo1[order(stevilo1)]
barve1 <- topo.colors(length(stevilo1))[match(drzave1, stevilo1)]
names(barve1) <- names(drzave1)
barve.zemljevid1 <- barve1[as.character(states$STATE_NAME)]
barve.zemljevid1[is.na(barve.zemljevid1)] <- "white"

imenadrzav1<-names(drzave1)
ZDA1<-states[states$STATE_NAME %in% imenadrzav1,]
koordinate1<-coordinates(ZDA1)
imena.drzav1<-as.character(ZDA1$STATE_NAME)

pdf("slike/amerika1.pdf", width=12, height=7)
plot(states, col=barve.zemljevid1, bg="lightblue")
text(koordinate1, labels=imena.drzav1, pos=1, cex=0.25)




 
