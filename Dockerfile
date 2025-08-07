FROM rust:latest

# نصب پیش‌نیازها
RUN apt-get update && apt-get install -y pkg-config libssl-dev git

# دایرکتوری کاری
WORKDIR /app

# کلون کردن سورس RustDesk Server
RUN git clone --branch 1.1.9 https://github.com/rustdesk/rustdesk-server.git .

# کپی فایل config.toml
COPY config.toml /app/config.toml

# ساخت فایل اجرایی
RUN cargo build --release --bin hbbs && cargo build --release --bin hbbr

# 🔥 این خط مهم است: فایل اجرایی را در مسیر قابل اجرا کپی کن
RUN cp target/release/hbbs /usr/local/bin/hbbs

# 🔥 این خط مهم است: به Railway بگو hbbs را اجرا کند
CMD ["hbbs"]
 
