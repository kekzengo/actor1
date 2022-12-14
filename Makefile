# Makefile for ui-backend

PROJECT  = actor1
VERSION  = $(shell cargo metadata --no-deps --format-version 1 | jq -r '.packages[] .version' | head -1)
REVISION = 0
# list of all contract claims for actor signing (space-separated)
CLAIMS   = wasmcloud:httpserver
# registry url for our actor
#
REG_URL  = ghcr.io/kekzengo/$(PROJECT):$(VERSION)

# command to upload to registry (without last wasm parameter)
PUSH_REG_CMD = wash reg push $(REG_URL) --allow-latest

# friendly name for the actor
ACTOR_NAME = "actor1"
# optional call alias for actor
# ACTOR_ALIAS=nickname
# registry.gitlab.com/wasm_exp/actor1:0.1.0
include ./actor.mk

test::
	cargo clippy --all-features --all-targets
