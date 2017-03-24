drop_tables:
	psql -d college_dev < ./sql.commands.drop.tables.txt

migrate:
	mix ecto.migrate

seed:
	mix run priv/repo/seeds.exs

scafold:
	./scafold.sh
