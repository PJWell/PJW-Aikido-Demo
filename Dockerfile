# Use official Node image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json pnpm-lock.yaml ./

# Enable pnpm
RUN corepack enable

# Install dependencies
RUN pnpm install --frozen-lockfile

# Copy the rest of the app
COPY . .

# Build the project (if it has a build step)
RUN pnpm build || true

# Expose port (common for web apps)
EXPOSE 3000

# Start the app
CMD ["pnpm", "start"]
