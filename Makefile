.PHONY: setup run test

setup:
	poetry install
	poetry run pre-commit install

test:
	poetry run pytest -v

lint:
	poetry run flake8

mypy:
	poetry run mypy ./scraper

black:
	poetry run isort .; poetry run black .

docs_dev:
	poetry run mkdocs serve

docs_build:
	poetry run mkdocs build

export_dependencies:
	poetry export -f requirements.txt --output requirements.txt

clean:
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +
	rm -f .coverage
	rm -fr htmlcov/
