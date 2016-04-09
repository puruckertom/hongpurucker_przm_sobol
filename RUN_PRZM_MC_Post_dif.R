pth='C:/Users/th/Dropbox/PRZM_R_MC'
load(paste(pth,'/All_Var_10000.RData', sep=""))


##########################################
#########Check the correlation############
##########################################

AD_s_comp1=array(AD_s[1:22,1,],dim=c(22,N_MC))
AD_s_comp2=array(AD_s[1:22,2,],dim=c(22,N_MC))

DIS_w_comp1=array(DIS_w[1:19,1,],dim=c(19,N_MC))

AD_s_comp1_dif=matrix(diff(AD_s_comp1[1,])/AD_s_comp1[1,1:(N_MC-1)])

#pestcide decay rate (d-1)
PLDKRT_dif=diff(PLDKRT)/PLDKRT[1:(N_MC-1)]

#Rooting Depth(cm)
AMXDR_dif=diff(AMXDR)/AMXDR[1:(N_MC-1)]

#Curve number ###USE GA1R ########
CN_f_dif=diff(CN_f)/CN_f[1:(N_MC-1)]
CN_c_dif=diff(CN_c)/CN_f[1:(N_MC-1)]
CN_r_dif=diff(CN_r)/CN_f[1:(N_MC-1)]

###Partition coefficient ########
Kd_dif=diff(Kd[1,])/Kd[1,1:(N_MC-1)]

####Bulk density###############
BD_dif=diff(BD[1,])/BD[1,1:(N_MC-1)]

#######Pan factor##############
PFAC_dif=diff(PFAC)/PFAC[1:(N_MC-1)]

#######Pan factor##############
TAPP_dif=diff(TAPP)/TAPP[1:(N_MC-1)]

####Management Factor##################
USLEC1_dif=diff(USLEC1)/USLEC1[1:(N_MC-1)]
USLEC2_dif=diff(USLEC2)/USLEC2[1:(N_MC-1)]


AD_s_comp1_dif_sum=data.frame(cbind(AD_s_comp1_dif,PLDKRT_dif,AMXDR_dif,CN_f_dif,CN_c_dif,CN_r_dif,Kd_dif,BD_dif,
                         PFAC_dif,TAPP_dif,USLEC1_dif,USLEC2_dif))
AD_s_comp1_dif_sum=subset(AD_s_comp1_dif_sum[which(rowSums(AD_s_comp1_dif_sum)!=Inf),])
Cor_AD_s_comp1_dif_sum=cor(AD_s_comp1_dif_sum)bb



plot(AD_s_comp1[2,])
line(1:5000,AD_s_comp1[10,],col='red')
