# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

# Uvozimo zemljevid.
cat("Uvažam zemljevid sveta...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_map_units.zip",
                        "svet", "ne_110m_admin_0_map_units.shp", mapa = "zemljevid",
                        encoding = "Windows-1252")

svet<- svet[svet$continent %in% c("Europe","Asia","South America","North America","Africa","Oceania") | svet$name_long == "Australia",]

drzave <- table(KNJIGE$Drzava)
imenadrzav<-names(drzave)
stevilo <- unique(drzave)
stevilo <- stevilo[order(stevilo)]
barve <- topo.colors(length(stevilo))[match(drzave, stevilo)]
names(barve) <- names(drzave)
barve.zemljevid <- barve[as.character(svet$name_long)]
barve.zemljevid[is.na(barve.zemljevid)] <- "white"

imenadrzav<-names(drzave)
moj<-svet[svet$name_long %in% imenadrzav,]
koordinate<-coordinates(moj)
imena.drzav<-as.character(moj$name_long)

rownames(koordinate) <- imena.drzav
koordinate["Northern Ireland",2] <- koordinate["Northern Ireland",2]+4.5
koordinate["Northern Ireland",1] <- koordinate["Northern Ireland",1]-6.0
koordinate["Ireland",2] <- koordinate["Ireland",2]+2.0
koordinate["Ireland",1] <- koordinate["Ireland",1]-1.5
koordinate["Spain",2] <- koordinate["Spain",2]+4.0
koordinate["France",2] <- koordinate["France",2]+4.0
koordinate["Germany",2] <- koordinate["Germany",2]+4.
koordinate["Netherlands",2] <- koordinate["Netherlands",2]+4.5
koordinate["Norway",1] <- koordinate["Norway",1]-5.5
koordinate["Norway",2] <- koordinate["Norway",2]+1.0
koordinate["Sweden",1] <- koordinate["Sweden",1]-1.5
koordinate["Sweden",2] <- koordinate["Sweden",2]+1.0
koordinate["England",2] <- koordinate["England",2]+5.5
koordinate["England",1] <- koordinate["England",1]+2.0
koordinate["Brazil",1] <- koordinate["Brazil",1]+5.0
koordinate["Brazil",2] <- koordinate["Brazil",2]+4.0
koordinate["Canada",2] <- koordinate["Canada",2]+5.0
koordinate["United States",2] <- koordinate["United States",2]+5.0
koordinate["Italy",2] <- koordinate["Italy",2]+3.5
koordinate["Australia",2] <- koordinate["Australia",2]+5.0


pdf("slike/knjige.pdf", width=12, height=7)
plot(svet, col=barve.zemljevid, bg="lightblue")
text(koordinate, labels=imena.drzav, pos=1, cex=0.25)



legend("bottomleft", title = 'število knjig po državah', text.font = 2,legend = stevilo, fill = topo.colors(length(stevilo)))
dev.off()


# # Funkcija, ki podatke preuredi glede na vrstni red v zemljevidu
# preuredi <- function(podatki, zemljevid) {
#   nove.svet <- c()
#   manjkajo <- ! nove.obcine %in% rownames(podatki)
#   M <- as.data.frame(matrix(nrow=sum(manjkajo), ncol=length(podatki)))
#   names(M) <- names(podatki)
#   row.names(M) <- nove.obcine[manjkajo]
#   podatki <- rbind(podatki, M)
#   
#   out <- data.frame(podatki[order(rownames(podatki)), ])[rank(levels(zemljevid$OB_UIME)[rank(zemljevid$OB_UIME)]), ]
#   if (ncol(podatki) == 1) {
#     out <- data.frame(out)
#     names(out) <- names(podatki)
#     rownames(out) <- rownames(podatki)
#   }
#   return(out)
# }
# 
# # Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
# drzave <- preuredi(drzave, svet)
# 
# 
# # Narišimo zemljevid v PDF.
# cat("Rišem zemljevid sveta...\n")
# pdf("slike/svet.pdf")
# 
# #n = 100
# #barve = topo.colors(n)[1+(n-1)*(druzine$povprecje-min.povprecje)/(max.povprecje-min.povprecje)]
# #plot(obcine, col = barve)
# 
# n = 100
# barve =rgb(1, 1, (n:1)/n)[unlist(1+(n-1)*norm.povprecje)]
# plot(slo, col = barve,bg="lightblue")
# text(koordinate1,labels=imena1,cex=0.4)
# title("Povprečna poraba vode na prebivalca")
# 
# dev.off()