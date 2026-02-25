serve:
	docker compose up

stop:
	docker compose down

build:
	docker compose run --rm zensical build -f mkdocs.toml

logs:
	docker compose logs -f zensical

ps:
	docker compose ps
