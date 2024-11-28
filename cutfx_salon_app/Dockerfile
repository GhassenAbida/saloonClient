# Use an official Dart image as the base image
FROM dart:stable

# Install dependencies for Flutter
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    git \
    curl \
    xz-utils \
    libglu1-mesa \
    clang \
    cmake \
    ninja-build \
    pkg-config \
    libgtk-3-dev \
    libblkid-dev \
    liblzma-dev \
    python3 && apt-get clean

# Set environment variables
ENV FLUTTER_HOME=/opt/flutter
ENV PATH="${FLUTTER_HOME}/bin:${PATH}"

# Download and install Flutter SDK
RUN git clone https://github.com/flutter/flutter.git -b stable $FLUTTER_HOME \
    && flutter doctor

# Run Flutter Doctor to pre-cache required binaries
RUN flutter doctor --android-licenses --no-interactive && \
    flutter doctor

# Set up the application directory
WORKDIR /app

# Copy the Flutter project into the container
COPY . .

# Expose ports (optional, if you have debugging or web needs)
EXPOSE 8080

# Default command to run the Flutter app
CMD ["flutter", "run", "--release"]
