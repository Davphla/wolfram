##
## EPITECH PROJECT, 2020
## makefile
## File description:
## gcc etc...
##

NAME = wolfram

all: $(NAME)

$(NAME): $(shell find src -type f -name "*.hs") $(shell find app -type f -name "*.hs")
	stack build
	cp "$(shell stack path --local-install-root)/bin/wolfram-exe" .
	mv wolfram-exe wolfram

clean:
	stack clean

fclean: clean
	stack purge
	rm -f $(NAME)

re: fclean all

.PHONY: clean fclean re all
