# Mapa s slikami

#V to mapo bomo dajali vse slike (grafe, zemljevide), ki jih bo naš program
#naredil in jih bomo vključili v končno poročilo.


pdf("slike/grafi.pdf",paper="a4")
tabela<-table(KNJIGE$Vrsta)
imena<-names(tabela)
vektor<-c(tabela)
barplot(vektor, names.arg = imena, xlab="VRSTA", ylab="ŠTEVILO KNJIG", main= 'ŠTEVILO KNJIG PO VRSTAH', las=2, cex.names=0.75, col="red")
dev.off()

pdf("slike/graf1.pdf",paper="a4")
tab<-table(KNJIGE$Spol)
vekto<-c(tab)
barplot(vekto, names.arg = c("Moski", "Zenske"), xlab="SPOL", ylab="ŠTEVILO", main= 'PISATELJI PO SPOLU', las=2, cex.names=0.75, col="red")
dev.off()


