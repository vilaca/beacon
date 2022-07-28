FROM ubuntu@sha256:b6b83d3c331794420340093eb706a6f152d9c1fa51b262d9bf34594887c2c7ac as build-stage
RUN apt update \
    && apt install -y make yasm as31 nasm binutils git \
    && git clone --quiet --depth=1 https://github.com/nemasu/asmttpd.git
WORKDIR asmttpd
RUN make release && echo -n OK > index.html

FROM scratch
COPY --from=build-stage asmttpd/asmttpd /asmttpd
COPY --from=build-stage asmttpd/index.html /public/index.html
CMD ["/asmttpd", "/public", "8080"] 
