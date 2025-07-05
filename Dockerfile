# Base image: use official Godot headless Linux build
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget unzip libxrandr2 libxcursor1 libxi6 libxinerama1 libgl1-mesa-glx libasound2 libpulse0 libssl-dev ca-certificates && \
    apt-get clean

# Create working directory
WORKDIR /app

# Download Godot headless
RUN wget https://downloads.tuxfamily.org/godotengine/4.4.1/Godot_v4.4.1-stable_linux.x86_64.zip -O godot.zip && \
    unzip godot.zip && \
    mv Godot_v4.4.1-stable_linux.x86_64 godot && \
    chmod +x godot && \
    rm godot.zip

# Copy your project files into the container
COPY . .

# Make your start script executable (if needed)
RUN chmod +x PODO\ SERVER.sh

# Tell Render how to run your server
CMD ["./godot", "--headless", "--path", ".", "--main-pack", "PODO_SERVER.pck"]
