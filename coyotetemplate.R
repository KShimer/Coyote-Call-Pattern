#rscript commands to develope a template call for coyotes
library(monitoR)
#initital read into for .wav files to be able to be used in template creation
coyote1.fp=file.path("coyote1.wav")
coyote2.fp=file.path("coyote2.wav")
coyote3.fp=file.path("coyote3.wav")
coyote4.fp=file.path("coyote4.wav")
viewSpec(coyote1)
#corelates templates
c1=makeCorTemplate(coyote1.fp)
co1=makeCorTemplate(coyote1.fp, t.lim = c(0.5, 3.5), frq.lim = c(0.0, 2), name = "co1")
co2<- makeCorTemplate(coyote2.fp, t.lim = c(1.5, 2.5), frq.lim = c(0.0,1.75), name = "co2")
co3 <- makeCorTemplate(coyote3.fp, t.lim = c(1.5, 4.0), frq.lim = c(0.0, 2.0), name = "co3")
co4 <- makeCorTemplate(coyote3.fp, t.lim = c(1.5, 4.0), frq.lim = c(0.0, 2.0), name = "co4")
coyotetemp=combineCorTemplates(co1, co2, co3, co4)
coyotetemp
plot(coyotetemp)
coyscore=corMatch(coyote3.fp, coyotetemp)
coyscore
#check for detections ability within the findPeaks fucntions
cdetects=findPeaks(coyscore)
cdetects
getDetections(cdetects)
plot(cdetects)
templateCutoff(coyotetemp)=c(co1 = 0.3, co2=.1, co3 = 0.2, co4 = 0.2)
coyotetemp
#Trimming of template to adjust side parameters
co2<- makeCorTemplate(coyote2.fp, t.lim = c(1.5, 2.5), frq.lim = c(0.0,1.75), name = "co2")
