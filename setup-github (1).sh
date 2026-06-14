#!/bin/bash

# ============================================
# GitHub Quick Setup Script
# Relationship Adviser AI Project
# ============================================

echo "🚀 GitHub Setup Script for Relationship Adviser AI"
echo "================================================"
echo ""

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Step 1: Stash current changes
echo -e "${YELLOW}Step 1: Saving current work...${NC}"
git stash push -m "Save work before GitHub setup"
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Changes stashed successfully${NC}"
else
    echo -e "${YELLOW}No changes to stash or already stashed${NC}"
fi
echo ""

# Step 2: Switch to main branch
echo -e "${YELLOW}Step 2: Switching to main branch...${NC}"
git checkout main
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Switched to main branch${NC}"
else
    echo -e "${RED}✗ Failed to switch to main branch${NC}"
    exit 1
fi
echo ""

# Step 3: Create feature branch
echo -e "${YELLOW}Step 3: Creating relationship-adviser branch...${NC}"
git checkout -b relationship-adviser
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Created and switched to relationship-adviser branch${NC}"
else
    echo -e "${RED}✗ Failed to create branch${NC}"
    exit 1
fi
echo ""

# Step 4: Apply stashed changes
echo -e "${YELLOW}Step 4: Restoring saved work...${NC}"
git stash pop
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Changes restored successfully${NC}"
else
    echo -e "${YELLOW}No stashed changes to restore${NC}"
fi
echo ""

# Step 5: Create .gitignore (if needed)
echo -e "${YELLOW}Step 5: Checking .gitignore...${NC}"
if [ ! -f ".gitignore" ]; then
    echo "Creating .gitignore..."
    cat > .gitignore << 'EOF'
# Dependencies
node_modules/
.pnp
.pnp.js

# Testing
coverage/
*.lcov

# Next.js
.next/
out/
build/
dist/

# Production
.vercel
.netlify

# Misc
.DS_Store
*.pem

# Debug
npm-debug.log*
yarn-debug.log*
yarn-error.log*
bun.lockb

# Local env files
.env*.local
.env.development
.env.production
.env.test

# Database
*.db
*.sqlite
*.sqlite3
db/dev.db
db/*.db
db/custom.db

# IDE
.vscode/
.idea/
*.swp
*.swo
*~

# Logs
logs/
*.log
npm-debug.log*

# Temporary files
tmp/
temp/
*.tmp

# OS
Thumbs.db

# Process IDs
*.pid
.zscripts/dev.pid

# Screenshots
screenshot.png
EOF
    echo -e "${GREEN}✓ Created .gitignore${NC}"
else
    echo -e "${GREEN}✓ .gitignore already exists${NC}"
fi
echo ""

# Step 6: Add all files
echo -e "${YELLOW}Step 6: Adding files to git...${NC}"
git add .
echo -e "${GREEN}✓ Files added${NC}"
echo ""

# Step 7: Commit changes
echo -e "${YELLOW}Step 7: Creating commit...${NC}"
git commit -m "Initial commit: AI-powered Relationship Adviser

- Complete authentication system with JWT
- 10-question relationship assessment
- AI-powered analysis with z-ai-web-dev-sdk
- Visual score charts with Recharts
- PDF report generation with jsPDF
- Assessment history and data persistence
- Modern UI with shadcn/ui and Tailwind CSS 4
- Comprehensive documentation
- Database schema with Prisma ORM
- RESTful API design with proper error handling"

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Committed successfully${NC}"
else
    echo -e "${YELLOW}Nothing to commit or commit already exists${NC}"
fi
echo ""

# Step 8: Instructions for GitHub setup
echo -e "${YELLOW}Step 8: Next Steps (Manual)${NC}"
echo "================================================"
echo ""
echo "1. Create a repository on GitHub:"
echo "   - Go to: https://github.com/new"
echo "   - Repository name: relationship-adviser"
echo "   - Description: AI-powered Relationship Adviser Application"
echo "   - Make it Public or Private"
echo "   - DO NOT add README or .gitignore (we already have them)"
echo "   - Click 'Create repository'"
echo ""
echo "2. Add remote repository:"
echo "   git remote add origin https://github.com/YOUR_USERNAME/relationship-adviser.git"
echo "   (Replace YOUR_USERNAME with your actual GitHub username)"
echo ""
echo "3. Push to GitHub:"
echo "   git push -u origin relationship-adviser"
echo ""
echo "OR use GitHub CLI (easier):"
echo "   gh auth login"
echo "   gh repo create relationship-adviser --public --source=. --remote=origin --push"
echo ""
echo -e "${GREEN}================================================${NC}"
echo -e "${GREEN}✓ Local setup complete!${NC}"
echo -e "${GREEN}Now follow the steps above to push to GitHub.${NC}"
echo ""