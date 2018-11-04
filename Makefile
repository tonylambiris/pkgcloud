BUILDFLAGS=-a -ldflags "-w -s"

all: test build

test:
	go test -v $(go list ./... | grep -v /vendor/)

generate:
	go generate -x ./...

build:
	mkdir -p bin/
	go build -o bin/pkgcloud-push $(BUILDFLAGS) \
		github.com/tonylambiris/pkgcloud/cmd/pkgcloud-push
	go build -o bin/pkgcloud-yank $(BUILDFLAGS) \
		github.com/tonylambiris/pkgcloud/cmd/pkgcloud-yank

clean:
	rm -f bin/pkgcloud-push bin/pkgcloud-yank
