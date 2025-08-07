
FROM rust:latest

RUN apt-get update && apt-get install -y pkg-config libssl-dev git

WORKDIR /app

RUN git clone --branch 1.1.9 https://github.com/rustdesk/rustdesk-server.git .

COPY config.toml /app/config.toml

RUN cargo build --release --bin hbbs && cargo build --release --bin hbbr

# 👇 اضافه شده: فایل اجرایی را کپی کن
RUN cp target/release/hbbs /usr/local/bin/hbbs

# 👇 اضافه شده: فرمان اجرای hbbs
CMD ["hbbs"]
