#pth='C:/Dropbox/PRZM_NEW_MC'
pth='C:/Users/th/Dropbox/PRZM_NEW_MC'
load(paste(pth,'/All_Var_20000_N.RData', sep=""))

##########################################
#########Check the correlation############
##########################################

AD_s_comp1=array(AD_s[1:22,1,],dim=c(22,N_MC))
DIS_w_comp1=array(DIS_w[1:19,1,],dim=c(19,N_MC))
SB_index=data.frame(dim=c(22,11))

  
#pestcide decay rate (d-1)
PLDKRT_AD_s_comp1=as.data.frame(rbind(PLDKRT,AD_s_comp1))
Cor_PLDKRT_AD_s_comp1=cor(t(PLDKRT_AD_s_comp1))

PLDKRT_t=rank(PLDKRT)/(N_MC+1)
a=qnorm(PLDKRT_t,mean=0,sd=1)
b=(a^2-1)
for (i in 1:22){
  SB_index[i,1]=b%*%AD_s_comp1[i,]/(norm(as.matrix(AD_s_comp1[i,]))*(2^0.5))
}

#Rooting Depth(cm)
AMXDR_AD_s_comp1=as.data.frame(rbind(AMXDR,AD_s_comp1))
Cor_AMXDR_AD_s_comp1=cor(t(AMXDR_AD_s_comp1))

AMXDR_t=rank(AMXDR)/(N_MC+1)
a=qnorm(AMXDR_t,mean=0,sd=1)
b=(a^2-1)
for (i in 1:22){
  SB_index[i,2]=b%*%AD_s_comp1[i,]/(norm(as.matrix(AD_s_comp1[i,]))*(2^0.5))
}

#Curve number ###USE GA1R ########
CN_f_AD_s_comp1=as.data.frame(rbind(CN_f,AD_s_comp1))
Cor_CN_f_AD_s_comp1=cor(t(CN_f_AD_s_comp1))

CN_f_t=rank(CN_f)/(N_MC+1)
a=qnorm(CN_f_t,mean=0,sd=1)
b=(a^2-1)
for (i in 1:22){
  SB_index[i,3]=b%*%AD_s_comp1[i,]/(norm(as.matrix(AD_s_comp1[i,]))*(2^0.5))
}

CN_c_AD_s_comp1=as.data.frame(rbind(CN_c,AD_s_comp1))
Cor_CN_c_AD_s_comp1=cor(t(CN_c_AD_s_comp1))
CN_c_t=rank(CN_c)/(N_MC+1)
a=qnorm(CN_c_t,mean=0,sd=1)
b=(a^2-1)
for (i in 1:22){
  SB_index[i,4]=b%*%AD_s_comp1[i,]/(norm(as.matrix(AD_s_comp1[i,]))*(2^0.5))
}

CN_r_AD_s_comp1=as.data.frame(rbind(CN_r,AD_s_comp1))
Cor_CN_r_AD_s_comp1=cor(t(CN_r_AD_s_comp1))
CN_r_t=rank(CN_r)/(N_MC+1)
a=qnorm(CN_r_t,mean=0,sd=1)
b=(a^2-1)
for (i in 1:22){
  SB_index[i,5]=b%*%AD_s_comp1[i,]/(norm(as.matrix(AD_s_comp1[i,]))*(2^0.5))
}

###Partition coefficient ########
Kd_AD_s_comp1=as.data.frame(rbind(Kd[1,],AD_s_comp1))
Cor_Kd_AD_s_comp1=cor(t(Kd_AD_s_comp1))
Kd_t=rank(Kd[1,])/(N_MC+1)
a=qnorm(Kd_t,mean=0,sd=1)
b=(a^2-1)
for (i in 1:22){
  SB_index[i,6]=b%*%AD_s_comp1[i,]/(norm(as.matrix(AD_s_comp1[i,]))*(2^0.5))
}

####Bulk density###############
BD_AD_s_comp1=as.data.frame(rbind(BD[1,],AD_s_comp1))
Cor_BD_AD_s_comp1=cor(t(BD_AD_s_comp1))
BD_t=rank(BD[1,])/(N_MC+1)
a=qnorm(BD_t,mean=0,sd=1)
b=(a^2-1)
for (i in 1:22){
  SB_index[i,7]=b%*%AD_s_comp1[i,]/(norm(as.matrix(AD_s_comp1[i,]))*(2^0.5))
}

#######Pan factor##############
PFAC_AD_s_comp1=as.data.frame(rbind(PFAC,AD_s_comp1))
Cor_PFAC_AD_s_comp1=cor(t(PFAC_AD_s_comp1))
PFAC_t=rank(PFAC)/(N_MC+1)
a=qnorm(PFAC_t,mean=0,sd=1)
b=(a^2-1)
for (i in 1:22){
  SB_index[i,8]=b%*%AD_s_comp1[i,]/(norm(as.matrix(AD_s_comp1[i,]))*(2^0.5))
}

#######Pan factor##############
TAPP_AD_s_comp1=as.data.frame(rbind(TAPP,AD_s_comp1))
Cor_TAPP_AD_s_comp1=cor(t(TAPP_AD_s_comp1))
TAPP_t=rank(TAPP)/(N_MC+1)
a=qnorm(TAPP_t,mean=0,sd=1)
b=(a^2-1)
for (i in 1:22){
  SB_index[i,9]=b%*%AD_s_comp1[i,]/(norm(as.matrix(AD_s_comp1[i,]))*(2^0.5))
}

####Management Factor##################
USLEC1_AD_s_comp1=as.data.frame(rbind(USLEC1,AD_s_comp1))
Cor_USLEC1_AD_s_comp1=cor(t(USLEC1_AD_s_comp1))
USLEC1_t=rank(USLEC1)/(N_MC+1)
a=qnorm(USLEC1_t,mean=0,sd=1)
b=(a^2-1)
for (i in 1:22){
  SB_index[i,10]=b%*%AD_s_comp1[i,]/(norm(as.matrix(AD_s_comp1[i,]))*(2^0.5))
}

USLEC2_AD_s_comp1=as.data.frame(rbind(USLEC2,AD_s_comp1))
Cor_USLEC2_AD_s_comp1=cor(t(USLEC2_AD_s_comp1))
USLEC2_t=rank(USLEC2)/(N_MC+1)
a=qnorm(USLEC2_t,mean=0,sd=1)
b=(a^2-1)
for (i in 1:22){
  SB_index[i,11]=b%*%AD_s_comp1[i,]/(norm(as.matrix(AD_s_comp1[i,]))*(2^0.5))
}

Cor_AD_s_comp1_sum=data.frame(PLDKRT=Cor_PLDKRT_AD_s_comp1[2:23,1],AMXDR=Cor_AMXDR_AD_s_comp1[2:23,1],
                              CN_f=Cor_CN_f_AD_s_comp1[2:23,1],CN_c=Cor_CN_c_AD_s_comp1[2:23,1],
                              CN_r=Cor_CN_r_AD_s_comp1[2:23,1],Kd=Cor_Kd_AD_s_comp1[2:23,1],
                              BD=Cor_BD_AD_s_comp1[2:23,1],PFAC=Cor_PFAC_AD_s_comp1[2:23,1],
                              TAPP=Cor_TAPP_AD_s_comp1[2:23,1],USLEC1=Cor_USLEC1_AD_s_comp1[2:23,1],
                              USLEC2=Cor_USLEC2_AD_s_comp1[2:23,1])

names(SB_index)=names(Cor_AD_s_comp1_sum)

rank(abs(colMeans(Cor_AD_s_comp1_sum)))
rank(abs(colMeans(SB_index)))





