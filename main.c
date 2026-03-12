#include "parser.h"
#include <stdio.h>

int main() {
    // 植入段错误：空指针解引用
    char *null_ptr = NULL;
    *null_ptr = 'a';  // 这一行会触发 SIGSEGV 段错误

    // 原有功能（不会执行到）
    const char *test_str = "Hello Ubuntu & Parser";
    int str_len = parse_string(test_str);
    printf("String Length: %d\n", str_len);

    return 0;
}
