### beacon

Nano http server. Container size=13.7kB.

Run:

    docker run -dp 8080:8080 --name beacon-test jvilaca/beacon:latest

Build:

    make release

Test:

    ./ci-scripts/test.sh
