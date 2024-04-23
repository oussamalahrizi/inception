

up : 
	mkdir -p ./data/mariadb
	mkdir -p ./data/wordpress
	sudo docker compose -f ./srcs/docker-compose.yml up -d

down : 
	sudo docker compose -f ./srcs/docker-compose.yml down

fclean : 
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all
	sudo rm -rf ./data/mariadb
	sudo rm -rf ./data/wordpress
build:
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all
	make up

clean_cache:
	sudo docker system prune -a

re : fclean up

.PHONY : fclean re up clean_cache
