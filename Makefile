download:
	curl -sfL https://s3.amazonaws.com/menusdata.nypl.org/gzips/2021_08_01_07_01_17_data.tgz | tar xzvC ./data/

run:
	docker run -it --name duckdb-server duckdb/duckdb

upload:
	docker cp ./data/Menu.csv duckdb-server:/Menu.csv
	docker cp ./data/MenuItem.csv duckdb-server:/MenuItem.csv
	docker cp ./data/MenuPage.csv duckdb-server:/MenuPage.csv
	docker cp ./data/Dish.csv duckdb-server:/Dish.csv

client:
	docker exec -it duckdb-server duckdb my_database.duckdb

stop:
	docker stop duckdb-server && docker rm duckdb-server

clean:
	docker rmi duckdb/duckdb:latest
	rm -rf ./data/*.csv