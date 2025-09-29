#include <stdio.h>

#define MAX_N 50
#define INIT_A 0
#define INIT_B 1

#define PRINT(x) printf("%d\n", x)

int main() {
    int a, b, i, t, n;

    a = INIT_A;
    b = INIT_B;
    i = 1;

    scanf("%d", &n);
    if (n > MAX_N) {
        printf("Input exceeds maximum value %d\n", MAX_N);
        return 1;
    }

    PRINT(a);
    PRINT(b);

    // this is a friendly annotation *
    while (i < n)
    {
        t = b;
        b = a + b;
        PRINT(b);
        a = t;
        i = i + 1;
    }
}
