clean:
	docker-compose down --volumes --remove-orphans
	docker image prune -af
	docker volume prune -f

clean_all:
	docker system prune -a -f

build:
	docker-compose build --no-cache
	make first_up

clean_and_rebuild:
	make clean
	make build

backup:
	docker exec postgres_db pg_dumpall -U postgres_user > ./backup/full_backup.sql
	echo "PostgreSQL backup successfully saved to: ./backup/full_backup.sql"

restore: 
	docker cp ./backup/full_backup.sql postgres_db:/var/lib/postgresql/data/full_backup.sql	
	docker exec postgres_db psql -U postgres_user -d postgres_db -f /var/lib/postgresql/data/full_backup.sql
	echo "Backup successfully restored to PostgreSQL."

up:
	docker-compose up -d

down: backup
	docker-compose down

makemigrations:
	docker compose run app python MyResume/manage.py makemigrations

migrate:
	docker compose run app python MyResume/manage.py migrate

get_requirements:
	docker exec -it app_service pip freeze > requirements.txt
	docker cp app_service:/srv/app/requirements.txt ./requirements.txt

collectstatic:
	docker compose run app python MyResume/manage.py collectstatic

first_up:
	make up
	make migrate
	make restore
