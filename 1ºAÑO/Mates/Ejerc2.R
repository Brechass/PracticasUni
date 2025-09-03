library(Matrix)
#Definición de matrices

A=matrix(c(-1,-2,3,
           -1,3,-1,
           2,-5,5),ncol=3,byrow=T)

b=matrix(c(9,-6,17),ncol=1,nrow=3,byrow=T)

A2=matrix(c(-1,-2,3,9,
            -1,3,-1,-6,
            2,-5,5,17),ncol=4,nrow=3,byrow=T)

#Rango (A|b)
rankMatrix(A2)

#RANGO DE LA MATRIZ (A|b)=3
# Si son linealmente independientes

#Solucion del sistema lineal A*x=b
solve(A,b)