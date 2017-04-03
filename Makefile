drop_tables:
	psql -d college_dev < ./drop_schema.sql

migrate:
	mix ecto.migrate

seed:
	mix run priv/repo/seeds.exs

scafold:
	./scafold.sh
