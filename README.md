# HieroTeX docker containers

This repository tests that HieroTeX can be installed and used on some popular Linux distributions,
via Docker.

## Test machine setup

- Debian Stable with latest stable version of Docker.
- User running tests must be in `docker` group.
- Host machine should have no TeX environment at all.
- Need GNU parallel

## Test everything

./test-hierotex.sh

## Build one container image

```
docker buid -f hierotex-debian-stretch/Dockerfile -t hierotex-debian-stretch .
```

## Build all container images

```
for i in $ITEMS; do echo docker build -f $i/Dockerfile -t $i .; done | parallel
```

## Test out an install

Test files from this repo are copied to each container image, you can launch a bash
shell to check that things work:

```
docker run --workdir=/test-files --rm -ti hierotex-debian-stretch
```

Or just run the test script to build the test files:

```
docker run --workdir=/test-files --rm -ti hierotex-debian-stretch ./test.sh
```

## Using container to build a document from the host machine

Once an image has been built, you can alias regular commands to run on a
temporary container, such as `latexmk`, like so:

```
alias latexmk="docker run -v $(pwd):/work/ --workdir=/work --rm -ti hierotex-debian-stretch latexmk"
```

This means that whenever you run `latexmk`, it will execute inside a new container, using any files in the current
directory.

(To pre-process and then compile HieroTeX files, you will need more than latexmk,
this is just an example!)
