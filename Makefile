# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmeising <mmeising@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/08 16:08:31 by mmeising          #+#    #+#              #
#    Updated: 2023/02/08 19:52:24 by mmeising         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

VPATH := ./src/
CXXFLAGS := -Wall -Wextra -Werror -std=c++98
INC := -I ./include

NAME := ./containers

SRC := main
SRC := $(SRC:%=%.cpp)

OBJ := $(addprefix ./_obj/, $(SRC:.cpp=.o))

all: $(NAME)
	@$(NAME)

$(NAME): $(OBJ)
	$(CXX) $(CXXFLAGS) $^ $(INC) -o $@

./_obj/%.o: %.cpp
	@mkdir -p _obj
	$(CXX) $(CXXFLAGS) -MMD -MP -c $< $(INC) -o $@

clean:
	rm -rf _obj/

fclean: clean
	rm -f $(NAME)

re:	fclean
	make

.PHONY: clean fclean
