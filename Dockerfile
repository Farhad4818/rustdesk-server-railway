 rust:latest

RUN apt-get update && apt-get install -y pkg-config libssl-dev git

RUN git clone --depth=1 https://github.com/rustdesk/rustdesk-server.git /rustdesk-server

WORKDIR /rustdesk-server

RUN cargo build --release --bin hbbs && cargo build --release --bin hbbr

EXPOSE 21115/tcp
EXPOSE 21116/tcp
EXPOSE 21116/udp

CMD ./target/release/hbbs & ./target/release/hbbr -c config/hbbr.toml
