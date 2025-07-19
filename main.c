#include "math/add.h"
#include "math/sub.h"
#include "utils.h"
#include "plugin.h"

int main(void) {
    int x = 5, y = 3;
    int s = add(x, y);
    print_result("+", x, y, s);

    int d = sub(x, y);
    print_result("-", x, y, d);

    // 呼叫 plugin
    plugin_mul_add(x, y, 2);

    return 0;
}

