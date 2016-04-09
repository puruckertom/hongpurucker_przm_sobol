library("sensitivity")
library("matlab")
library("fast")

x=linspace(-5,5,200)
y=array(dim=c(200,1))

ff <- function(p) {
  return (p[1]*p[3]+p[2]*(1-p[3]))
}

paras<-fast_parameters(minimum=c(-3,0,0),maximum=c(10,1,1),factor=1)
paras
model_results <- apply(paras, 1, ff)
model_results

plot(model_results)
sensitivity <- sensitivity(x=model_results, numberf=1, make.plot=TRUE)
sensitivity

############################
ff1 <- function(p) {
  return (cos(p[1])**0+cos(p[2])+cos(p[3])**2)
}
paras1<-fast_parameters(minimum=c(-3,-3,-3),maximum=c(3,3,3),factor=4)
paras1

model_results1 <- apply(paras1, 1, ff1)
model_results1
plot(model_results1)
sensitivity1 <- sensitivity(x=model_results1, numberf=3, make.plot=TRUE,include.total.variance=TRUE)
sensitivity1

cor(model_results1,paras1[,1])
cor(model_results1,paras1[,2])
cor(model_results1,paras1[,3])



# ff1 <- function(x) {
#   return (sin(x[, 1]) )
# }
# 
# for (i in 1:200){
#   y[i]=ff(x[i])
#   
# }
# cor(x,y)  
# 
# x_t=rank(x)/(200+1)
# a=qnorm(x_t,mean=0,sd=1)
# b=(a^2-1)
# b%*%y/(norm(as.matrix(y))*(2^0.5))
# 
# sa <- fast99(model = ff1, factors = 1, n = 1000,
#            q = "qunif", q.arg = list(min = -pi, max = pi))
# 
# sa1 <- fast99(model = ishigami.fun, factors = 3, n = 1000,
#             q = "qunif", q.arg = list(min = -pi, max = pi))
# 
# plot(x,y)




