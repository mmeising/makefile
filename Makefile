#	:= means setting variables unconditionally
NAME := foo
HEADERFILES := src/greeter.h
OBJFILES := main.o greeter.o
#	no need tp put obj/ before every object file thanks to this:
OBJFILES := $(OBJFILES:%=obj/%)
CC := gcc
#	?= means setting variables if not set before
#	(e.g. with command: LDFLAGS="-Wall -Wextra -g" make
#	compiles in debug mode (-g) and doesn't stop compiling on warnings)
LDFLAGS ?=
CFLAGS ?= -Wall -Werror -Wextra

#syntax is as follows:
#target: prerequisites
#	recipe

#	$@ resolves to target, $^ to all prerequisites, $< to first prerequisite
$(NAME): $(OBJFILES)
	$(CC) $(LDFLAGS) -o $@ $^

#	mkdir only creates directory when it doesn't exist yet
#	$(dir names) extracts the directory from the name
obj/%.o: src/%.c $(HEADERFILES)
	@mkdir -p $(dir $@)
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -f $(OBJFILES)

fclean: clean
	rm -f $(NAME)

.PHONY: clean fclean