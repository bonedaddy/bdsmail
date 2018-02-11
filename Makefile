REPO := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

ifdef GOROOT
	GO = $(GOROOT)/bin/go
else
	GO = $(shell which go)
	GOROOT = $(shell $(GO) env GOROOT)
endif

all: build

build:
	GOPATH=$(REPO) $(GO) install -v bds/cmd/maild
	GOPATH=$(REPO) $(GO) install -v bds/cmd/newmail
	GOPATH=$(REPO) $(GO) install -v bds/cmd/bdsconfig

clean:
	GOPATH=$(REPO) go clean -v

test:
	GOPATH=$(REPO) go test bds/lib/...
