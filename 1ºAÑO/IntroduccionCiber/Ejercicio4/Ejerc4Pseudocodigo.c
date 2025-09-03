#include <stdio.h>

int main() {
    int n1, n2, n3;
    scanf("%d\n", &n1);
    scanf("%d\n", &n2);
    scanf("%d",  &n3);
    float media = ((n1 + n2 + n3) / 3) ;
    if (media >= 5) {
        printf("El alumno ha aprobado");
    }
    else {
        printf("El alumno ha suspendido");
    }
    return 0;

}
