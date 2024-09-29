NAME	= libmx.a
CFLG	= -std=c11 -Wall -Wextra -Werror -Wpedantic
CC	= clang
SRCD	= src
SRC	= printchar.c printstr.c printint.c pow.c sqrt.c is_space.c itoa.c \
foreach.c binary_search.c strlen.c strcpy.c strcmp.c strstr.c strtrim.c strnew.c \
strdup.c strndup.c print_strarr.c bubble_sort.c quicksort.c strstr.c strcat.c \
print_unicode.c swap_char.c nbr_to_hex.c str_reverse.c strdel.c strjoin.c \
del_strarr.c strncpy.c strndup.c hex_to_nbr.c replace_substr.c file_to_str.c file_len.c \
memccpy.c memchr.c memcmp.c memcpy.c memmem.c memmove.c memrchr.c memset.c \
read_line.c realloc.c count_substr.c count_words.c del_extra_spaces.c get_char_index.c\
pop_back.c push_front.c pop_front.c push_back.c sort_list.c list_size.c get_substr_index.c \
create_node.c strsplit.c strncmp.c strntrim.c strntrim.c numlen.c swap_str.c
SRCS	= $(addprefix $(SRCD)/, $(SRC))
INCD	= inc
INC	= libmx.h
INCS	= $(INCD)/$(INC)
OBJD	= obj
OBJS 	= $(addprefix $(OBJD)/, $(SRC:%.c=%.o))
all: install
install: $(NAME)
$(NAME): $(OBJS)
	@ar rcs $@ $^

$(OBJD)/%.o: $(SRCD)/%.c $(INCS)
	@$(CC) $(CFLG) -c $< -o $@ -I$(INCD)
$(OBJS): | $(OBJD)
$(OBJD):
	@mkdir -p $@
uninstall: clean
	@rm -f $(NAME)
clean:
	@rm -rf $(OBJD)
	@rm -f $(NAME)
reinstall: uninstall install
