set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\u001b[31m'
NC='\033[0m'

echo -e "${YELLOW}Preparing to create a new service account...${NC}"
cd ../playbooks

ansible-playbook -i ../inventory/hosts create-service-account.yml
echo -e "${GREEN}Successfully created a service account${NC}"

echo -e "${YELLOW}Preparing to add the minecraft prometheus data source to grafana${NC}"
ansible-playbook -i ../inventory/hosts add-prometheus-datasource.yml
echo -e "${GREEN}Successfully added Minecraft prometheus data to grafana!${NC}"
