FROM alpine:3.11.2
ENV CARGO_INSTALL_ROOT="/usr/local/cargo"
RUN apk --no-cache add rust cargo fontconfig-dev graphite2-dev harfbuzz-dev icu-dev openssl-dev zlib-dev g++ && \
    cargo install tectonic && \
    adduser -S tectonic

USER tectonic
ENV PATH="/usr/local/cargo/bin:${PATH}"
WORKDIR /home/tectonic

ENTRYPOINT ["/usr/local/cargo/bin/tectonic"]
CMD ["--help"]
