#!/bin/bash
# Docker Setup Test Script

set -e

echo "=== Docker Setup Test ==="
echo ""

echo "1. Stopping existing containers..."
docker-compose down

echo ""
echo "2. Building containers..."
docker-compose build

echo ""
echo "3. Starting containers..."
docker-compose up -d

echo ""
echo "4. Waiting for database to initialize (15 seconds)..."
sleep 15

echo ""
echo "5. Checking database connectivity..."
docker-compose exec -T db mysql -u mrdbid_user -puR\!TxC4avEWp mrdbid_development -e "SELECT 1 as test;" || {
    echo "ERROR: Database connection failed!"
    exit 1
}

echo ""
echo "6. Running migrations..."
docker-compose exec web rails db:migrate || {
    echo "ERROR: Migrations failed!"
    exit 1
}

echo ""
echo "7. Running seeds..."
docker-compose exec web rails db:seed || {
    echo "ERROR: Seeds failed!"
    exit 1
}

echo ""
echo "8. Checking permissions were created..."
docker-compose exec -T db mysql -u mrdbid_user -puR\!TxC4avEWp mrdbid_development -e "SELECT * FROM permissions;" || {
    echo "ERROR: Permissions query failed!"
    exit 1
}

echo ""
echo "=== SUCCESS! Docker setup is working ==="
echo ""
echo "Application is running at http://localhost:3000"
echo "To view logs: docker-compose logs -f web"
echo "To stop: docker-compose down"
