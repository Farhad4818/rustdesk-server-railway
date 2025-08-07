
FROM rust:latest

RUN apt-get update && apt-get install -y pkg-config libssl-dev git

WORKDIR /app

RUN git clone --branch 1.1.9 https://github.com/rustdesk/rustdesk-server.git .

RUN cargo build --release --bin hbbs && cargo build --release --bin hbbr

EXPOSE 21115/tcp
EXPOSE 21116/tcp
EXPOSE 21116/udp

COPY config.toml /app/config.toml
CMD ["./target/release/hbbr", "--config", "/app/config.toml"]
CMD ["./target/release/hbbs", "--config", "/app/config.toml"]
