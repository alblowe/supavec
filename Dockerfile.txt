# Base image with Node.js and Bun
FROM oven/bun:1.1.13

# Set working directory inside the container
WORKDIR /app

# Copy everything to the container
COPY . .

# Navigate to the frontend directory
WORKDIR /app/apps/web

# Install dependencies and build
RUN bun install
RUN bun run build

# Expose port (change if needed)
EXPOSE 3000

# Run the app
CMD ["bun", "run", "start"]
