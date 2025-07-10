# Stage 1: Use Bun to install all workspace deps
FROM oven/bun:1.1.13 as bun-builder

WORKDIR /app
COPY . .

# Install dependencies (works with workspace:* and Bun monorepos)
RUN bun install

# Stage 2: Use Node to build and run Next.js
FROM node:20

WORKDIR /app

# Copy deps from Bun stage
COPY --from=bun-builder /app /app

# Navigate to frontend app
WORKDIR /app/apps/web

# Build the Next.js app with Node
RUN npm run build

# Expose port
EXPOSE 3000

# Start the app (edit if your script is different)
CMD ["npm", "start"]
