# ---- Stage 1: Build with Node ----
FROM node:20 AS builder

WORKDIR /app

# Copy everything
COPY . .

# Move into the frontend app
WORKDIR /app/apps/web

# Install deps and build
RUN npm install
RUN npm run build

# ---- Stage 2: Serve with Bun ----
FROM oven/bun:1.1.13

WORKDIR /app

# Copy only the built app from the previous stage
COPY --from=builder /app/apps/web /app

# Install only what's needed to run (optional)
RUN bun install --production

EXPOSE 3000

CMD ["bun", "run", "start"]
