FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    libx11-6 \
    libxcursor1 \
    libxrandr2 \
    libxi6 \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy both the binary and your start script
COPY PODO_SERVER.x86_64 /app/PODO_SERVER.x86_64
COPY PODO_SERVER.shs /app/PODO_SERVER.shs
RUN chmod +x /app/PODO_SERVER.x86_64 /app/PODO_SERVER.shs

EXPOSE 8080

# Use the shell script as the entrypoint
CMD ["./PODO_SERVER.shs"]
