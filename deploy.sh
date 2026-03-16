#!/bin/bash
# Deploy The Shepherd's Guild site to Cloudflare Pages
# Usage: ./deploy.sh
#
# Workflow:
#   1. Edit HTML files in this directory
#   2. git add + git commit
#   3. ./deploy.sh
#
# This pushes to GitHub AND deploys to Cloudflare Pages in one step.

set -e

# Push to GitHub
echo "📤 Pushing to GitHub..."
git push origin main

# Deploy to Cloudflare Pages
echo "🚀 Deploying to Cloudflare Pages..."
source .env
CLOUDFLARE_API_TOKEN="$CLOUDFLARE_API_TOKEN" \
  npx wrangler pages deploy . --project-name shepherds-guild --branch main

echo ""
echo "✅ Done! Live at https://theshepherdsguild.com"
