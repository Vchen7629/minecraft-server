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

<pre><code>AWS_ACCESS_KEY="your access key here"</code></pre>
<pre><code>AWS_SECRET_ACCESS_KEY="your secret access key here"</code></pre>


<h2>Monitoring</h2>

<h2>Backups</h2>
