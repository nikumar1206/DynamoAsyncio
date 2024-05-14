PYTHON := python
PIP := pip
PACKAGE_NAME := your_package_name

install:
	@$(PIP) install --upgrade $(PIP)
	@$(PIP) install -r requirements.txt

test:
	@$(PYTHON) -m pytest tests/

clean:
	@rm -rf dist build *.egg-info

build: clean
	@$(PYTHON) setup.py sdist bdist_wheel

upload: build
	@$(PYTHON) -m twine upload dist/*

help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make <command>\ncommands:\033[36m\033[0m\n"} /^[$$()% a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

MAKEFLAGS += --always-make
