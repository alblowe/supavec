FROM node:20

# Set working directory
WORKDIR /app

# Copy monorepo code
COPY . .

# Install all dependencies (workspace-aware)
RUN npm install

# Navigate to frontend app
WORKDIR /app/apps/web

# Build the frontend
RUN npm run build

# Expose Next.js default port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
