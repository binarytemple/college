drop_tables:
	psql -d college_dev < ./drop_schema.sql

drop_test_tables:
	psql -d college_test < ./drop_schema.sql

migrate:
	mix ecto.migrate

migrate_test:
	MIX_ENV=test mix ecto.migrate

seed:
	mix run priv/repo/seeds.exs

scafold:
	./scafold.sh
