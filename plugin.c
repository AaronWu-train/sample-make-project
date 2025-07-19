#include "math/add.h"
#include "utils.h"
#include "plugin.h"

int plugin_mul_add(int a, int b, int c) {
    int sum = add(a, b);
    int result = sum * c;
    print_result("*add", a, b, result);
    return result;
}

