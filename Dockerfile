# Swift image
FROM swift:5.3 as build

# Create app directory
WORKDIR /app

# Copy source files
COPY . .

# Install dependencies
RUN swift package resolve

# Build application
RUN swift build -c release

# Runtime image
FROM swift:5.3-slim

WORKDIR /app
COPY --from=build /app/.build/release /app

CMD ["./Run"]
