#(D+3)· x ≡ 13 ·(D+7) mod (83)
#D=7+0+2=9
#(9+3) * x = 13 * (9+7)mod(83)
#12x=208 mod (83)
#12 x = 42 mod (83)
a=12 
x=0 # Esta variable será la que irá aumentando en el bucle 
while ((a*x)%%83!=42){ #El bucle parará cuando se encuentre el resto deseado
  x=x+1 #La variable aumentará de 1 en 1 probando todos los números posibles múltiplos
}       # de a hasta encontrar el número deseado
print(x) #Aparecerá por consola la x deseada 
print(a*x) #Será el número congruente que buscabamos
