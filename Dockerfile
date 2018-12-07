FROM alpine:3.8
ENV CARGO_INSTALL_ROOT="/usr/local/cargo"
RUN apk --no-cache add rust cargo fontconfig-dev graphite2-dev harfbuzz-dev icu-dev openssl-dev zlib-dev g++ && \
    cargo install tectonic && \
    apk del rust cargo fontconfig-dev graphite2-dev harfbuzz-dev icu-dev openssl-dev zlib-dev g++ && \
    adduser -S tectonic
USER tectonic
ENV PATH="/usr/local/cargo/bin:${PATH}"

ENTRYPOINT ["/usr/local/cargo/bin/tectonic"]
CMD ["--help"]
