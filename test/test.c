/*
 * This software is dedicated to Public Domain and, as such, bears no
 * copyright. Please see LICENSE file for details.
 */
#include <stdio.h>

int main(int argc, char **argv)
{
    double a = 10.0;
    double b = 13.5;

    printf("This is a test. argc = %d, argv[0]=%s\n", argc, argv[0]);

    printf("a=%g, b=%g, a/b=%g\n", a, b, a / b);

    return 0;
}
