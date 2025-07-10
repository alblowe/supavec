# Use Bun (has native workspace support)
FROM oven/bun:1.1.13

WORKDIR /app

# Copy the whole monorepo
COPY . .

# Install all workspace deps (at the root)
RUN bun install

# Build the frontend app inside the monorepo
WORKDIR /app/apps/web
RUN bun run build

# Expose frontend port
EXPOSE 3000

# Start the app
CMD ["bun", "run", "start"]
