# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

# Uvozimo zemljevid.
cat("Uvažam zemljevid sveta...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_map_units.zip",
                        "svet", "ne_110m_admin_0_map_units.shp", mapa = "zemljevid",
                        encoding = "Windows-1252")

svet<- svet[svet$continent %in% c("Europe","Asia","South America","North America") | svet$name_long == "Australia",]

drzave <- table(KNJIGE$Drzava)
stevilo <- unique(drzave)
stevilo <- stevilo[order(stevilo)]
barve <- topo.colors(length(stevilo))[match(drzave, stevilo)]
names(barve) <- names(drzave)
barve.zemljevid <- barve[as.character(svet$name_long)]
barve.zemljevid[is.na(barve.zemljevid)] <- "white"

# imenadrzav<-names(drzave)
# mojs<-svet[svet$name_long %in% imenadrzav,]
# koordinate<-coordinates(mojs)
# imena.drzav<-as.character[mojs$name_long]




pdf("slike/knjige.pdf", width=12, height=7)
plot(svet, col=barve.zemljevid, bg="lightblue")
# text(koordinate, labels=imena.drzav, pos=1, cex=0.25)



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