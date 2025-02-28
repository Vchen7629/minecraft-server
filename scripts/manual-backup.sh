set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\u001b[31m'
NC='\033[0m'

echo -e "${YELLOW}Preparing to manually trigger the backup...${NC}"

cd ../deploy

docker compose exec backup backup now

echo -e "${GREEN}Sucessfully Backed up data to s3 bucket!${NC}"

