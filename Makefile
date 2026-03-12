# 编译器指定
CC = gcc
# 编译选项：-Wall 显示所有警告，-g 生成调试信息（用于 GDB）
CFLAGS = -Wall -g

# 目标可执行文件名
TARGET = main
# 依赖的目标文件
OBJS = main.o parser.o
# 静态库名
STATIC_LIB = libparser.a
# 动态库名
SHARED_LIB = libparser.so

# 默认目标：编译生成可执行文件
all: $(TARGET)

# 链接目标文件生成可执行文件
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

# 编译 .c 文件生成 .o 文件（自动匹配所有 .c 文件）
%.o: %.c parser.h
	$(CC) $(CFLAGS) -c $< -o $@

# 生成静态库
static: $(OBJS)
	ar rs $(STATIC_LIB) $(OBJS)

# 生成动态库（-fPIC 位置无关代码，-shared 标记为共享库）
shared: $(OBJS)
	$(CC) $(CFLAGS) -fPIC -shared -o $(SHARED_LIB) $(OBJS)

# 清理所有编译产物
clean:
	rm -f $(TARGET) $(OBJS) $(STATIC_LIB) $(SHARED_LIB) core tmpfile
