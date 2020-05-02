.PHONY: setup test lint run test-dev

#################################################################################
# GLOBALS                                                                       #
#################################################################################


PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PROFILE = default
PROJECT_NAME = hackathon-mining
PYTHON_INTERPRETER = python3

# Alias python paths
PYTHON_ENV := pipenv run python
PYTEST := pipenv run pytest
LINTER := pipenv run flake8
PY_SHELL := pipenv shell
#################################################################################
# COMMANDS                                                                      #
#################################################################################


setup:
	$(PYTHON_INTERPRETER) -m pip install  --upgrade pip
	$(PYTHON_INTERPRETER) -m pip install  pipenv
	cd py-core
	pipenv install -r requirements.txt
	

clean-data:
	$(PYTHON_ENV) py-core/create_dataframe_from_docs.py
	

# you can run make run --query 'mining water'
run: py-core/main-search-engine.py
	$(PYTHON_ENV) py-core/main-search-engine.py --query ${query} 

