docker-nasho-start:
	docker compose up -d

docker-nasho-stop:
	docker compose down

docker-nasho-container:
	docker compose ps

docker-nasho-images:
	docker image ls

docker-nasho-restart:
	docker compose restart

docker-nasho-logs:
	docker compose logs -f

docker-nasho-build:
	docker compose build app


#run porto nasho shell
nasho-serve:
	php artisan serve
	
nasho-migrate:
	php artisan migrate

nasho-refresh:
	php artisan migrate:refresh
	php artisan db:seed

nasho-rollback:
	php artisan migrate:rollback

nasho-key-generate:
	php artisan key:generate
