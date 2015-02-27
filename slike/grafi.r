
pdf("slike/grafi.pdf",paper="a4")
tabela<-table(KNJIGE$Vrsta)
imena<-names(tabela)
vektor<-c(tabela)
barplot(vektor, names.arg = imena, xlab="VRSTA", ylab="ŠTEVILO KNJIG", main= 'ŠTEVILO KNJIG PO VRSTAH', las=2, cex.names=0.75, col="red")
dev.off()

pdf("slike/tortni.pdf",paper="a4")
tortni<-pie(table(KNJIGE$Spol), labels= c("Moški", "Ženske"), main="PISATELJI PO SPOLU")
zenske <- round(sum(KNJIGE$Spol=="Z")*100/(sum(KNJIGE$Spol=="M")+sum(KNJIGE$Spol=="Z")), digits=2)
moski <- round(sum(KNJIGE$Spol=="M")*100/(sum(KNJIGE$Spol=="M")+sum(KNJIGE$Spol=="Z")), digits=2)
text(0.3, -0.5, paste0(zenske,"%"), col = "black")
text(0, 0.5, paste0(moski,"%"), col = "black")
dev.off()

# 
# pdf("slike/graf1.pdf",paper="a4")
# tab<-table(KNJIGE$Spol)
# vekto<-c(tab)
# barplot(vekto, names.arg = c("Moški", "Ženske"), xlab="SPOL", ylab="ŠTEVILO", main= 'PISATELJI PO SPOLU', las=2, cex.names=0.75, col="red")
# dev.off()

pdf("slike/graf2.pdf",paper="a4")
tabela2<-table(KNJIGE$Film)
vek<-c(tabela2)
barplot(vek, names.arg = c("DA", "NE"), xlab="POSNET FILM- DA/NE", ylab="ŠTEVILO", main= 'ŠTEVILO KNJIG, PO KATERIH SO POSNELI FILM', las=2, cex.names=0.75, col="lightblue")
dev.off()


pdf("slike/letoi.pdf",paper="a4")
hist(KNJIGE$"Leto.izdaje", breaks=9, xlab="LETO", ylab="ŠTEVILO KNJIG", main="IZDAJA KNJIG PO LETIH", col="lightblue")
dev.off()



