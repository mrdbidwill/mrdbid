#!/bin/bash
set -e

echo "=== Deploying mrdbid to production ==="
echo ""

# Server details
SERVER="root@85.31.233.192"
DEPLOY_DIR="/opt/mrdbid"

# Step 1: Push latest code
echo "Step 1: Pushing code to GitHub..."
git push origin main || { echo "Git push failed"; exit 1; }
echo "✓ Code pushed"
echo ""

# Step 2: Pull on server
echo "Step 2: Pulling latest code on server..."
ssh $SERVER "cd $DEPLOY_DIR && git pull origin main" || { echo "Git pull failed"; exit 1; }
echo "✓ Code pulled on server"
echo ""

# Step 3: Verify environment file
echo "Step 3: Verifying .env.production..."
ssh $SERVER "cd $DEPLOY_DIR && test -f .env.production && grep -q RAILS_MASTER_KEY .env.production" || {
    echo "ERROR: .env.production missing or doesn't contain RAILS_MASTER_KEY"
    exit 1
}
echo "✓ Environment file verified"
echo ""

# Step 4: Rebuild and restart containers
echo "Step 4: Rebuilding Docker containers..."
ssh $SERVER "cd $DEPLOY_DIR && docker compose -f docker-compose.prod.yml down"
ssh $SERVER "cd $DEPLOY_DIR && docker compose -f docker-compose.prod.yml build --no-cache web"
ssh $SERVER "cd $DEPLOY_DIR && docker compose -f docker-compose.prod.yml up -d"
echo "✓ Containers rebuilt and started"
echo ""

# Step 5: Check health
echo "Step 5: Waiting for application to become healthy..."
sleep 10
for i in {1..12}; do
    if ssh $SERVER "cd $DEPLOY_DIR && docker compose -f docker-compose.prod.yml ps web | grep -q 'healthy'"; then
        echo "✓ Application is healthy!"
        echo ""
        echo "=== Deployment successful! ==="
        echo "Visit https://mrdbid.com to verify"
        exit 0
    fi
    echo "Waiting... ($i/12)"
    sleep 5
done

echo "⚠ Application did not become healthy in time"
echo "Checking logs..."
ssh $SERVER "cd $DEPLOY_DIR && docker compose -f docker-compose.prod.yml logs --tail=50 web"
exit 1
