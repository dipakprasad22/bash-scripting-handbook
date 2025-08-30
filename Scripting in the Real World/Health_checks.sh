#!/bin/bash
# ---------------------------------------------------------------
# Health Checks Script: Checks port, service, and API health
# This script demonstrates basic health checks for teaching purposes.
# ---------------------------------------------------------------

# 1. Check if a TCP port is open on a host
HOST="localhost"
PORT=80
echo "Checking if port $PORT is open on $HOST..."
if nc -z -w2 $HOST $PORT; then
    echo "Port $PORT on $HOST is OPEN."
else
    echo "Port $PORT on $HOST is CLOSED."
fi
# Explanation:
# - nc: netcat utility for network connections.
# - -z: Zero-I/O mode (just check if port is open).
# - -w2: Wait 2 seconds for a response.

# 2. Check if a service is running (e.g., nginx)
SERVICE="nginx"
echo "Checking if service '$SERVICE' is running..."
if systemctl is-active --quiet $SERVICE; then
    echo "Service '$SERVICE' is RUNNING."
else
    echo "Service '$SERVICE' is NOT running."
fi
# Explanation:
# - systemctl is-active --quiet: Returns 0 if service is active, no output.
# - $SERVICE: Replace with your service name.

# 3. Check if an API endpoint is healthy (HTTP status 200)
API_URL="http://localhost/api/health"
echo "Checking API health at $API_URL..."
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" $API_URL)
if [ "$HTTP_STATUS" -eq 200 ]; then
    echo "API is HEALTHY (HTTP 200)."
else
    echo "API is UNHEALTHY (HTTP $HTTP_STATUS)."
fi
# Explanation:
# - curl: Command-line tool for HTTP requests.
# - -s: Silent mode.
# - -o /dev/null: Discard output.
# - -w "%{http_code}": Output only HTTP status code.

# End of script