set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\u001b[31m'
NC='\033[0m'

echo -e "${YELLOW}Preparing to restore server data...${NC}"

echo -e "${YELLOW}List of restores available${NC}"
cd ../deploy
docker compose exec backup restic -r s3:https://s3.amazonaws.com/zephyrus-enigmatica-server-backup snapshots

read -p "Enter restore id you want to restore or exit: " restore_id

if [ "$restore_id" = "exit" ]; then
    echo -e "${GREEN}Successfully exited out of restore process"
elif [ "$restore_id" = "e" ]; then
    echo -e "${GREEN}Successfully exited out of restore process"
elif [ "$restore_id" = "latest" ]; then
    docker compose exec backup mkdir -p /tmp/restore
    docker compose exec backup restic -r s3:https://s3.amazonaws.com/zephyrus-enigmatica-server-backup restore $restore_id --target /tmp/restore
    docker compose exec backup ls -la /tmp/restore
    docker compose exec backup cp -r /tmp/restore/. /
else
    docker compose exec backup mkdir -p /tmp/restore
    docker compose exec backup restic -r s3:https://s3.amazonaws.com/zephyrus-enigmatica-server-backup restore latest --target /tmp/restore
    docker compose exec backup ls -la /tmp/restore
    docker compose exec backup cp -r /tmp/restore/. /
fi

echo -e "${GREEN}Sucessfully Restored Backup from s3 bucket!${NC}"


