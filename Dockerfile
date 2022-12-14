#
# Builder
#

FROM golang:1.18-alpine AS builder

# Create a workspace for the app
WORKDIR /app

# Copy over the files
COPY . ./

# Build
RUN go build -o proxy

#
# Runner
#

FROM alpine AS runner

WORKDIR /

# Copy from builder the final binary
COPY --from=builder /app/proxy /proxy

ENTRYPOINT ["/proxy"]
