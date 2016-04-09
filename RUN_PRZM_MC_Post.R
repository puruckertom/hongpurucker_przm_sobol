#pth='C:/Dropbox/PRZM_NEW_MC'
pth='C:/Users/th/Dropbox/PRZM_NEW_MC'
load(paste(pth,'/All_Var_20000.RData', sep=""))
source('C:/Users/th/Dropbox/PRZM_NEW_MC/multiplot.R')

#################################################
########Compare MC Values VS MC##################
#################################################
AD_s_max=apply(AD_s, c(1,2), max)
DIS_w_max=apply(DIS_w, c(1,2), max)
AD_s_min=apply(AD_s, c(1,2), min)
DIS_w_min=apply(DIS_w, c(1,2), min)

AD_test=matrix(c(25.4,26.7,97.4,15.4,75.4,25.4,78.3,18.8,60.3,349,15.4,8.2,3.25,3.57,2.50,2.64,3.31,1.80,0,0,0,0,
                95.8,51.3,147,47.8,132,28.5,117,42.1,94.6,509,35.7,13.7,7.38,4.49,4.23,4.72,6.68,2.63,0.99,0.99,0.99,0.99,
                67,40.3,122.8,35.8,94.3,27.4,102.4,30.5,80.9,422,22.5,10.1,5.3,3.9,3.3,3.4,5,2.3,0.5,0.5,0.5,0.5,
                176.4,26.4,164,54.5,186.4,46.32,157.6,69.08,159.6,522.5,41.59,0.67,0.02,0,0,0,0,0,0,0,0,0),c(22,4))
DAT=c(0,10,11,20,21,31,32,41,42,63,90,117,145,173,207,242,270,299,328,361,399,426)
AD_test=cbind(DAT,AD_test)
colnames(AD_test)=c("Days", "Exp_min",  "Exp_max", "Exp_mean", "Simu")
AD_test=as.data.frame(AD_test)

DIS_test=matrix(cbind(c(0,0,0,0.16,0,0.09,0.09,0,0.09,0,0.11,0.16,0.09,0,0,0.09,0,0.09,0.14),
                     c(0.09,0.09,0.09,0.49,0.09,0.16,0.24,0.09,0.26,0.09,0.22,0.55,0.37,0.09,0.09,0.44,0.09,0.13,0.16),
                     c(0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.35,0.23,0.05,0.05,0.27,0.05,0.05,0.16),
                     c(0.36,0.24,2.11,1.44,98.84,41.29,24.44,8.99,1.08,0.08,0,0,0,0,0,0,0,0,0)),c(19,4))
DIS_test=cbind(c(10,20,31,41,63,90,117,145,173,208,243,271,300,328,362,399,427,453,489),DIS_test)
colnames(DIS_test)=c("Days", "Exp_min",  "Exp_max", "Exp_mean", "Simu")
DIS_test=as.data.frame(DIS_test)

AD_MC=data.frame(Days=AD_test[,1],MC_min=AD_s_min[,1],MC_max=AD_s_max[,1],
                 MC_mean=AD_s_mean[,1],Simu=AD_test[,5])

DIS_MC=data.frame(Days=DIS_test[,1],MC_min=DIS_w_min[1:19,1],MC_max=DIS_w_max[1:19,1],
                 MC_mean=DIS_w_mean[1:19,1],Simu=DIS_test[,5])

# ggplot(AD_test, aes(x=AD_test[,1], y=AD_test[,4])) + 
#   geom_errorbar(aes(ymin=AD_test[,2], ymax=AD_test[,3],), width=.1) +
#   geom_line() +
#   geom_point(x=AD_test[,1], y=AD_test[,5])+
#   scale_colour_manual(values=c("red","green","blue"))

p1<-ggplot(AD_test)+
  geom_line(aes(x=AD_test[,1], y=AD_test[,2],colour="Exp_min")) + 
  geom_line(aes(x=AD_test[,1], y=AD_test[,3],colour="Exp_max")) + 
  geom_line(aes(x=AD_test[,1], y=AD_test[,4],colour="Exp_mean")) +
  geom_point(aes(x=AD_test[,1], y=AD_test[,5],colour="Simu")) +
  scale_colour_manual("Soil Concentration-Report", 
                      breaks = c("Exp_min", "Exp_max", "Exp_mean","Simu"),
                      values = c("red", "green", "blue","black")) 

p2<-ggplot(AD_MC)+
  geom_line(aes(x=AD_MC[,1], y=AD_MC[,2],colour="MC_min")) + 
  geom_line(aes(x=AD_MC[,1], y=AD_MC[,3],colour="MC_max")) + 
  geom_line(aes(x=AD_MC[,1], y=AD_MC[,4],colour="MC_mean")) +
  geom_point(aes(x=AD_MC[,1], y=AD_MC[,5],colour="Simu")) +
  scale_colour_manual("Soil Concentration-MC", 
                      breaks = c("MC_min", "MC_max", "MC_mean","Simu"),
                      values = c("red", "green", "blue","black"))

p3<-ggplot(DIS_test)+
  geom_line(aes(x=DIS_test[,1], y=DIS_test[,2],colour="Exp_min")) + 
  geom_line(aes(x=DIS_test[,1], y=DIS_test[,3],colour="Exp_max")) + 
  geom_line(aes(x=DIS_test[,1], y=DIS_test[,4],colour="Exp_mean")) +
#  geom_point(aes(x=DIS_test[,1], y=DIS_test[,5],colour="Simu")) +
  scale_colour_manual("Soil Pore water Concentration-Report", 
                      breaks = c("Exp_min", "Exp_max", "Exp_mean"),
                      values = c("red", "green", "blue","black")) 

p4<-ggplot(DIS_MC)+
  geom_line(aes(x=DIS_MC[,1], y=DIS_MC[,2],colour="MC_min")) + 
  geom_line(aes(x=DIS_MC[,1], y=DIS_MC[,3],colour="MC_max")) + 
  geom_line(aes(x=DIS_MC[,1], y=DIS_MC[,4],colour="MC_mean")) +
#  geom_point(aes(x=DIS_MC[,1], y=DIS_MC[,5],colour="Simu")) +
  scale_colour_manual("Soil Pore water Concentration-MC", 
                      breaks = c("MC_min", "MC_max", "MC_mean","Simu"),
                      values = c("red", "green", "blue","black"))

multiplot(p1, p2, p3, p4, cols=2)

##########################################
#########Check the correlation############
##########################################

AD_s_comp1=array(AD_s[1:22,1,],dim=c(22,N_MC))
DIS_w_comp1=array(DIS_w[1:19,1,],dim=c(19,N_MC))

#AD_s_comp1_dif=matrix(diff(AD_s_comp1[1,])/AD_s_comp1[1,1:(N_MC-1)])

#pestcide decay rate (d-1)
PLDKRT_AD_s_comp1=as.data.frame(rbind(PLDKRT,AD_s_comp1))
Cor_PLDKRT_AD_s_comp1=cor(t(PLDKRT_AD_s_comp1))
www=cor((PLDKRT_AD_s_comp1))
#PLDKRT_AD_s_comp1_dif=as.data.frame(rbind((PLDKRT-PLDKRT_m)/PLDKRT_m,AD_s_comp1_mean_dif)
#Cor_PLDKRT_AD_s_comp1_dif=cor(t(PLDKRT_AD_s_comp1_dif))


PLDKRT_DIS_w_comp1=as.data.frame(rbind(PLDKRT,DIS_w_comp1))
Cor_PLDKRT_DIS_w_comp1=cor(t(PLDKRT_DIS_w_comp1))

#Rooting Depth(cm)
#AMXDR_m=mean(AMXDR)
AMXDR_AD_s_comp1=as.data.frame(rbind(AMXDR,AD_s_comp1))
Cor_AMXDR_AD_s_comp1=cor(t(AMXDR_AD_s_comp1))

#AMXDR_AD_s_comp1_dif=as.data.frame(rbind((AMXDR-AMXDR_m)/AMXDR_m,AD_s_comp1_mean_dif))
#Cor_AMXDR_AD_s_comp1_dif=cor(t(AMXDR_AD_s_comp1_dif))

AMXDR_DIS_w_comp1=as.data.frame(rbind(AMXDR,DIS_w_comp1))
Cor_AMXDR_DIS_w_comp1=cor(t(AMXDR_DIS_w_comp1))

#Curve number ###USE GA1R ########
CN_f_AD_s_comp1=as.data.frame(rbind(CN_f,AD_s_comp1))
Cor_CN_f_AD_s_comp1=cor(t(CN_f_AD_s_comp1))
CN_f_DIS_w_comp1=as.data.frame(rbind(CN_f,DIS_w_comp1))
Cor_CN_f_DIS_w_comp1=cor(t(CN_f_DIS_w_comp1))

CN_c_AD_s_comp1=as.data.frame(rbind(CN_c,AD_s_comp1))
Cor_CN_c_AD_s_comp1=cor(t(CN_c_AD_s_comp1))
CN_c_DIS_w_comp1=as.data.frame(rbind(CN_c,DIS_w_comp1))
Cor_CN_c_DIS_w_comp1=cor(t(CN_c_DIS_w_comp1))

CN_r_AD_s_comp1=as.data.frame(rbind(CN_r,AD_s_comp1))
Cor_CN_r_AD_s_comp1=cor(t(CN_r_AD_s_comp1))
CN_r_DIS_w_comp1=as.data.frame(rbind(CN_r,DIS_w_comp1))
Cor_CN_r_DIS_w_comp1=cor(t(CN_r_DIS_w_comp1))

###Partition coefficient ########
Kd_AD_s_comp1=as.data.frame(rbind(Kd[1,],AD_s_comp1))
Cor_Kd_AD_s_comp1=cor(t(Kd_AD_s_comp1))
Kd_DIS_w_comp1=as.data.frame(rbind(Kd[1,],DIS_w_comp1))
Cor_Kd_DIS_w_comp1=cor(t(Kd_DIS_w_comp1))

####Bulk density###############
BD_AD_s_comp1=as.data.frame(rbind(BD[1,],AD_s_comp1))
Cor_BD_AD_s_comp1=cor(t(BD_AD_s_comp1))
BD_DIS_w_comp1=as.data.frame(rbind(BD[1,],DIS_w_comp1))
Cor_BD_DIS_w_comp1=cor(t(BD_DIS_w_comp1))

#######Pan factor##############
PFAC_AD_s_comp1=as.data.frame(rbind(PFAC,AD_s_comp1))
Cor_PFAC_AD_s_comp1=cor(t(PFAC_AD_s_comp1))
PFAC_DIS_w_comp1=as.data.frame(rbind(PFAC,DIS_w_comp1))
Cor_PFAC_DIS_w_comp1=cor(t(PFAC_DIS_w_comp1))

#######Pan factor##############
TAPP_AD_s_comp1=as.data.frame(rbind(TAPP,AD_s_comp1))
Cor_TAPP_AD_s_comp1=cor(t(TAPP_AD_s_comp1))
TAPP_DIS_w_comp1=as.data.frame(rbind(TAPP,DIS_w_comp1))
Cor_TAPP_DIS_w_comp1=cor(t(TAPP_DIS_w_comp1))

####Management Factor##################
USLEC1_AD_s_comp1=as.data.frame(rbind(USLEC1,AD_s_comp1))
Cor_USLEC1_AD_s_comp1=cor(t(USLEC1_AD_s_comp1))
USLEC1_DIS_w_comp1=as.data.frame(rbind(USLEC1,DIS_w_comp1))
Cor_USLEC1_DIS_w_comp1=cor(t(USLEC1_DIS_w_comp1))

USLEC2_AD_s_comp1=as.data.frame(rbind(USLEC2,AD_s_comp1))
Cor_USLEC2_AD_s_comp1=cor(t(USLEC2_AD_s_comp1))
USLEC2_DIS_w_comp1=as.data.frame(rbind(USLEC2,DIS_w_comp1))
Cor_USLEC2_DIS_w_comp1=cor(t(USLEC2_DIS_w_comp1))

Cor_AD_s_comp1_sum=data.frame(PLDKRT=Cor_PLDKRT_AD_s_comp1[2:23,1],AMXDR=Cor_AMXDR_AD_s_comp1[2:23,1],
                              CN_f=Cor_CN_f_AD_s_comp1[2:23,1],CN_c=Cor_CN_c_AD_s_comp1[2:23,1],
                              CN_r=Cor_CN_r_AD_s_comp1[2:23,1],Kd=Cor_Kd_AD_s_comp1[2:23,1],
                              BD=Cor_BD_AD_s_comp1[2:23,1],PFAC=Cor_PFAC_AD_s_comp1[2:23,1],
                              TAPP=Cor_TAPP_AD_s_comp1[2:23,1],USLEC1=Cor_USLEC1_AD_s_comp1[2:23,1],
                              USLEC2=Cor_USLEC2_AD_s_comp1[2:23,1])

Cor_DIS_w_comp1_sum=data.frame(PLDKRT=Cor_PLDKRT_DIS_w_comp1[2:20,1],AMXDR=Cor_AMXDR_DIS_w_comp1[2:20,1],
                              CN_f=Cor_CN_f_DIS_w_comp1[2:20,1],CN_c=Cor_CN_c_DIS_w_comp1[2:20,1],
                              CN_r=Cor_CN_r_DIS_w_comp1[2:20,1],Kd=Cor_Kd_DIS_w_comp1[2:20,1],
                              BD=Cor_BD_DIS_w_comp1[2:20,1],PFAC=Cor_PFAC_DIS_w_comp1[2:20,1],
                              TAPP=Cor_TAPP_DIS_w_comp1[2:20,1],USLEC1=Cor_USLEC1_DIS_w_comp1[2:20,1],
                              USLEC2=Cor_USLEC2_DIS_w_comp1[2:20,1])

rank(abs(colMeans(Cor_AD_s_comp1_sum)))
rank(abs(colMeans(Cor_DIS_w_comp1_sum)))





