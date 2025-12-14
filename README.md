# duckdb-playground

Setup duckdb server with datasets using container.

## Makefile

    $ make download  # Download dataset.

    $ make run  # Run duckdb-server container.

    $ make upload  # Copy CSVs into container.

    $ make client  # Run duckdb client within the container.

    $ make shell  # Run shell within the container.

    $ make stop  # Stop duckdb-server container.

    $ make clean  # Remove container, image, and datasets.

# SQL files

    sql/create_tables.sql  # Create tables and insert data from CSVs within the container.

    sql/selects.sql  # Exploratory queries.

    sql/drop_tables.sql  # Drop all tables.

Adapted from clickhouse for duckdb from: https://clickhouse.com/docs/getting-started/example-datasets/menus
