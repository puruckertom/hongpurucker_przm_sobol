##############Prepare files to the same folder for simulation####################
#pth='I:/Dropbox/PRZM_R_MC'

#pth='C:/Users/th/Dropbox/PRZM_R_MC'
pth='C:/Dropbox/PRZM_NEW_MC'

unlink(paste(pth,'/Out_Test', sep=""),recursive=TRUE) ##delete a folder
dir.create(file.path(pth,'Out_Test'))

file.copy(paste(pth,'/input/GA1L_2PA.INP', sep=""), paste(pth,'/Out_Test', sep=""))
file.copy(paste(pth,'/input/przm3.run', sep=""), paste(pth,'/Out_Test', sep=""))
file.copy(paste(pth,'/input/met/GA1LEVAP.MET', sep=""), paste(pth,'/Out_Test', sep=""))
file.copy(paste(pth,'/source/przm3123.exe', sep=""), paste(pth,'/Out_Test', sep=""))

#################################################
########Update parameter values##################
#################################################

system.time({
  N_MC=20000
  Nobs_day_s=22   #soil
  AD_s=array(dim=c(Nobs_day_s, 6, N_MC))
  DIS_w=array(dim=c(Nobs_day_s, 2, N_MC))
  
  
  
  for (Ite in 1:N_MC){
    print(Ite)
    con <- file(paste(pth,'/Out_Test/GA1L_2PA.INP', sep=""))
    a=readLines(con)
    
    #pestcide decay rate (d-1)
    #PLDKRT=-log(0.5)/10^(rbeta(N_MC, 4.00, 9.92)*3.37) 
    PLDKRT=runif(N_MC, 0.01,2) 
    a[92]=paste(substr(a[92],1,8),sprintf("%8.2E", PLDKRT[Ite]),substr(a[92],17,24),sep="")
    
    #Rooting Depth(cm)
    #AMXDR=runif(N_MC, min=32, max=90)          #Corn
    AMXDR=runif(N_MC, min=10, max=90)          #Corn
    a[24]=paste(substr(a[24],1,16), sprintf("%8.2E", AMXDR[Ite]),substr(a[24],25,68),sep="")
    
    #Curve number ###USE GA1R ########
    #CN_f=round(runif(N_MC, min=82, max=88),0)  #Curve number fallow
    CN_f=round(runif(N_MC, min=0, max=100),0)  #Curve number fallow
    #CN_c=round(runif(N_MC, min=73, max=91),0)  #Curve number cropping
    CN_c=round(runif(N_MC, min=0, max=100),0)  #Curve number cropping
    #CN_r=round(runif(N_MC, min=75, max=81),0)  #Curve number resudial
    CN_r=round(runif(N_MC, min=0, max=100),0)  #Curve number resudial
    a[24]=paste(substr(a[24],1,42), CN_f[Ite],"  ", CN_c[Ite], "  ", CN_r[Ite],substr(a[24],53,68),sep="")
    a[36]=paste(substr(a[36],1,2), CN_c[Ite],"   ", CN_r[Ite], sep="")
    
    ###Partition coefficient ########
    Num=11
    #Kd=replicate(N_MC,runif(Num, min=0.250, max=0.360))
    Kd=replicate(N_MC,runif(Num, min=0.01, max=0.99))
    row_0=114
    
    for (i in 1:Num){
      row_t=row_0+(i-1)*9
      a[row_t]=paste(substr(a[row_t],1,40), sprintf("%8.2E", Kd[i,Ite]), sep="")
    }
    
    ####Bulk density###############
    BD=array(dim=c(11,N_MC))
#     BD[1,]=runif(N_MC, min=1.49, max=1.56)     #0-10cm
#     BD[2,]=BD[1,]                            #11-15cm
#     BD[3,]=runif(N_MC, min=1.49, max=1.60)  #16-30cm
#     BD[4,]=runif(N_MC, min=1.49, max=1.57)  #31-45cm
#     BD[5,]=runif(N_MC, min=1.49, max=1.59)  #46-75cm
#     BD[6,]=runif(N_MC, min=1.54, max=1.57)  #76-90cm
#     BD[7,]=runif(N_MC, min=1.54, max=1.57)  #91-120cm
#     BD[8,]=runif(N_MC, min=1.54, max=1.62)  #121-135cm
#     BD[9,]=runif(N_MC, min=1.54, max=1.59)  #136-150cm
#     BD[10,]=BD[9,]
#     BD[11,]=BD[10,]
    
      BD[1,]=runif(N_MC, min=1, max=2)     #0-10cm
      BD[2,]=BD[1,]                            #11-15cm
      BD[3,]=runif(N_MC, min=1, max=2)  #16-30cm
      BD[4,]=runif(N_MC, min=1, max=2)  #31-45cm
      BD[5,]=runif(N_MC, min=1, max=2)  #46-75cm
      BD[6,]=runif(N_MC, min=1, max=2)  #76-90cm
      BD[7,]=runif(N_MC, min=1, max=2)  #91-120cm
      BD[8,]=runif(N_MC, min=1, max=2)  #121-135cm
      BD[9,]=runif(N_MC, min=1, max=2)  #136-150cm
      BD[10,]=BD[9,]
      BD[11,]=BD[10,]
    
    row_0=108
    for (i in 1:Num){
      row_t=row_0+(i-1)*9
      a[row_t]=paste(substr(a[row_t],1,16), sprintf("%8.2E", BD[i,Ite]), substr(a[row_t],17,24),sep="")
    }
    
    #######Pan factor##############
#    PFAC=runif(N_MC, min=0.75, max=0.77)
    PFAC=runif(N_MC, min=0.60, max=0.80)
    a[10]=paste(sprintf("%8.2E", PFAC[Ite]),substr(a[10],9,68), sep="")
    
    #######Application rate########
    Num_Tapp=25
    row_0=61
    TAPP=runif(N_MC, min=0.01, max=0.64)       #one application for all or different
    for (i in 1:Num_Tapp){
      row_t=row_0+(i-1)*1
      a[row_t]=paste(substr(a[row_t],1,18), sprintf("%5.3f", TAPP[Ite]), substr(a[row_t],24,34), sep="")
    }
    
    ####Management Factor##################
    USLEC1=runif(N_MC, min=0.01, max=0.99)       #establishment
    USLEC2=runif(N_MC, min=0.01, max=0.99)       #maturing
    a[32]=paste(sprintf("%4.3f", USLEC1[Ite]), " ", sprintf("%4.3f", USLEC2[Ite]), sep="")
    
    writeLines(a,con)
    close(con)
    
    
    ##########################
    ####Run PRZM##############
    ##########################
    setwd(paste(pth,'/Out_Test', sep=""))
    system(paste(pth,'/Out_Test/przm3123.exe', sep=""),intern = TRUE)
    
    
    ##########################
    ####Check outputs#########
    ##########################
    
    Skip_s=c(226, 236, 237, 246, 247, 257, 258, 267, 268, 289, 316, 343, 371, 399, 433,
             468, 496, 525, 554, 587, 625, 652)
    
    Skip_w=c(236, 246, 257, 266, 289, 316, 343, 371, 399, 434, 469, 497, 526, 554, 588,
             625, 653, 679, 715, 731, 731, 731) #only first 19 are meaningful
    
    file_out <- file(paste(pth,'/Out_Test/GA1L_2PA.ZTS', sep=""))
    bb <- read.table(file_out,skip=3,nrows=734)
    
    for (k in 1:Nobs_day_s){
      #       file_out <- file(paste(pth,'/Out_Test/GA1L_2PA.ZTS', sep=""))
      #       bb <- read.table(file_out,skip=3,nrows=734)
      
      AD_s[k,1,Ite]=bb$V6[Skip_s[k]]    #0-15
      AD_s[k,2,Ite]=bb$V7[Skip_s[k]]    #15-30
      AD_s[k,3,Ite]=bb$V8[Skip_s[k]]    #30-45
      AD_s[k,4,Ite]=bb$V9[Skip_s[k]]    #45-60
      AD_s[k,5,Ite]=bb$V10[Skip_s[k]]   #60-75
      AD_s[k,6,Ite]=bb$V11[Skip_s[k]]   #75-90
      
      DIS_w[k,1,Ite]=bb$V12[Skip_w[k]]   #75-105
      DIS_w[k,2,Ite]=bb$V13[Skip_w[k]]   #165-195

      
    }
    
    
    
  }
  AD_s_mean=apply(AD_s, c(1,2), mean)
  DIS_w_mean=apply(DIS_w, c(1,2), mean)
  
}, gcFirst = TRUE)

save.image(paste(pth,'/All_Var_20000.RData', sep=""))
##########################################################
