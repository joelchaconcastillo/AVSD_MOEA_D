## Autor: Joel Chacón Castillo
## Descripción: En este fichero se cargan las superficies de cubriemiento del benchmark WFG y se imprime una imagen de cada instancia...
library("eaf")


#pdf("WFG",width=10,height=10,paper='special') 
Instances = c("WFG1", "WFG2", "WFG3", "WFG4","WFG5", "WFG6", "WFG7", "WFG8", "WFG9")

for( i in Instances)
{
	setEPS()
	postscript(paste(i,".eps", sep=""))
#	postscript(paste(i,".eps", sep=""), width=7, height=7)
	strGDE3 = paste( "../GDE3/Summary_", i, sep="")
	GDE3 =  read.data.sets(strGDE3)
	
	strMOEAD = paste( "../MOEAD/Summary_", i, sep="")
	MOEAD =  read.data.sets(strMOEAD)

	strNSGAII = paste( "../NSGAII/Summary_", i, sep="")
	NSGAII =  read.data.sets(strNSGAII)

	strSMSEMOA = paste( "../SMSEMOA/Summary_", i, sep="")
	SMSEMOA =  read.data.sets(strSMSEMOA)

	strPROPOSAL = paste( "../PROPOSAL/Summary_", i, sep="") ##La propuesta..
	MOEAD_EVSD =  read.data.sets(strPROPOSAL)
	
	strOPTIMAL = paste( "../OPTIMAL/Summary_", i, sep="") 
	OPTIMAL =  read.data.sets(strOPTIMAL)
	###Como solucón temporal dado que son muchos puntos y el archivo eps es pesado se obtiene una muestra de la solucion optima..
	OPTIMAL = OPTIMAL[sample(nrow(OPTIMAL), size=2000, replace=FALSE),]

	eafplot( list( GDE3=GDE3,  MOEAD=MOEAD, NSGAII=NSGAII, SMSEMOA=SMSEMOA, MOEAD_EVSD=MOEAD_EVSD ), percentiles=c(50), extra.points=OPTIMAL, extra.pch=16, cex=0.1, extra.col="red", extra.legend=c("OPTIMAL"), main = i, col=c("yellow", "green", "blue", "magenta", "black"))
	#eafplot( list( GDE3=GDE3,  MOEAD=MOEAD, NSGAII=NSGAII, SMSEMOA=SMSEMOA, PROPOSAL=PROPOSAL, OPTIMAL=OPTIMAL ), percentiles=c(50))
	dev.off()
}

#WFG1 <- read.data.sets("")
#WFG1Optimal <- read.data.sets("WFG1.txt")
#eafplot(WFG1, WFG1Optimal)

##WFG2 <- read.data.sets("Attain_Surface_WFG2.txt")
##WFG2Optimal <- read.data.sets("WFG2.txt")
##eafplot(WFG2, WFG2Optimal)
##WFG3 <- read.data.sets("Attain_Surface_WFG3.txt")
##WFG3Optimal <- read.data.sets("WFG3.txt")
##eafplot(WFG3, WFG3Optimal)
##WFG4 <- read.data.sets("Attain_Surface_WFG4.txt")
##WFG4Optimal <- read.data.sets("WFG4.txt")
##eafplot(WFG4, WFG4Optimal)
##WFG5 <- read.data.sets("Attain_Surface_WFG5.txt")
##WFG5Optimal <- read.data.sets("WFG5.txt")
##eafplot(WFG5, WFG5Optimal)
##WFG6 <- read.data.sets("Attain_Surface_WFG6.txt")
##WFG6Optimal <- read.data.sets("WFG6.txt")
##eafplot(WFG6, WFG6Optimal)
##WFG7 <- read.data.sets("Attain_Surface_WFG7.txt")
##WFG7Optimal <- read.data.sets("WFG7.txt")
##eafplot(WFG7, WFG7Optimal)
##WFG8 <- read.data.sets("Attain_Surface_WFG8.txt")
##WFG8Optimal <- read.data.sets("WFG8.txt")
##eafplot(WFG8, WFG8Optimal)
##WFG9 <- read.data.sets("Attain_Surface_WFG9.txt")
##WFG9Optimal <- read.data.sets("WFG9.txt")
##eafplot(WFG9, WFG9Optimal)
