export VERSION ?= latest
SERVICES = map mapsrv gateway

.PHONY: all release build push

all: build

release: build push
build: $(addprefix build., $(SERVICES))
push: $(addprefix push., $(SERVICES))

release.%:
	$(MAKE) build.$* push.$*

build.%:
	$(call wall, BUILDING IMAGE $*)
	$(DC) build $*

push.%:
	$(call wall, PUSHING IMAGE $*)
	$(DC) push $*


DC = docker-compose $(COMPOSE_ARGS)
COMPOSE_ARGS = -f $(COMPOSE_FILE)
COMPOSE_FILE = docker-compose.build.yml

define wall
	@echo =========================================
	@echo $1
	@echo =========================================
endef