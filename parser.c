#include "parser.h"

// 实现字符串长度统计
int parse_string(const char *str) {
    int len = 0;
    if (str == NULL) {
        return 0;
    }
    while (str[len] != '\0') {
        len++;
    }
    return len;
}

// 实现文本行数统计
int count_lines(const char *text) {
    int lines = 1;
    if (text == NULL) {
        return 0;
    }
    while (*text != '\0') {
        if (*text == '\n') {
            lines++;
        }
        text++;
    }
    return lines;
}
