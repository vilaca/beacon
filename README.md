## beacon

Tiny containerized HTTP server. 13.7kB total size.

Run:

    docker run -dp 8080:8080 --name beacon jvilaca/beacon:latest

Build:

    docker build . --tag jvilaca/beacon

Test:

    ./ci-scripts/test.sh
