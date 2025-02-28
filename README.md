<h1>Minecraft Server</h1>
<p>This Repository contains the files for automating setting up my production Minecraft Server with Autodeploying Resources, Monitoring, and backups </p>
<h2>Getting Started</h2>
<p>For this project i am using ubuntu but any flavor of linux should work</p>
<h3>Dependencies</h3>
<ul>
  <li>Docker: Can be installed in ubuntu following: https://docs.docker.com/engine/install/ubuntu/</li>
  <li>An Aws Account</li>
  <li>Terraform: Can be installed following: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli</li>
  <li>Ansible: Can be installed following: https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html</li>
</ul>
<h3>Setting Up</h3>
<p>1. <code>cd copy</code></p>
<p>2. <code>touch .env</code></p>
<p>3. <code>docker compose up -d</code></p>

<p>Add your aws access and secret key to the .env file like:</p>

```env
AWS_ACCESS_KEY="your access key here"
AWS_SECRET_ACCESS_KEY="your secret access key here"
```
<p>Note: This Requires a properly configured aws role with access to s3 buckets</p>
<p>This should start the minecraft server on a docker container</p>

<h2>Minecraft Server Configuration</h2>
<p>Minecraft server config values can be found in the docker compose file unter the mc services</p>
<h3> Config Values</h3>
<p>Type: Specify your server type</p>
<ul> 
  <li>VANILLA</li>
  <li>FORGE</li>
  <li>SPIGOT</li>
  <li>FABRIC</li>
  <li>PAPER</li>
  <li>QUILT</li>
</ul>
<p>EULA: Set to "TRUE" so that the server can run</p>
<p>Memory: Amount of ram you want to allocate to the server</p>
<p>Version: Minecraft Server Version you want to run on, must match modpack version if you are planning on running a modded minecraft server</p>
<p>FORGE_VERSION: Optional, can set to a specific version to reduce chances of errors</p>
<p>OPS: optional, can add to specify an admin user or users</p>
<p>TZ: optional, change to set your server timezone</p>
<p>ENABLE_RCON: optional, set to true for server to work with restic backup service</p>
<p>RCON_PASSWORD: optional, password for the rcon connection</p>
<p>RCON_PORT: optional, port for the backup service to connect with minecraft server container</p>
<h2>Monitoring</h2>
<p>This server uses prometheus to scrape metrics to send to a grafana dashboard</p>
<p>Currently the setup sends metrics to my grafana server hosted at www.verturus.com</p>
<h3>Configuration</h3>
<p>Currently the prometheus scrapes metrics every 30s, if you wanted to change it you would need to go to the prometheus.yml file and change the scrape_interval value</p>
<h2>Backups</h2>
<p>The server uses a s3 store the backup data</p>
<h3>Setting up</h3>
<p>Terraform automatically provisions and creates the bucket</p>
<p>1. <code>cd infrastructure/s3</code></p>
<p>2. <code>touch terraform.tfvars</code></p>
<p>1. <code>Terraform init</code></p>
<p>1. <code>Terraform apply</code></p>

<p>Add your aws access and secret key to the terraform.tfvars file like:</p>

```env
AWS_ACCESS_KEY="your access key here"
AWS_SECRET_ACCESS_KEY="your secret access key here"
```
<p>This will automatically create the s3 bucket on your aws account</p>
<p>
  Note: You can change the bucket name by going to the variables.tf file and changing the default value but you will need
  to copy this and change the RESTIC_REPOSITORY value in docker-compose, and the http url in the restore-script.sh to the new name
</p>
