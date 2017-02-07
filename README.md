## Dockerized Cloudify orchestrate tool


Install Cloudify manager on aws using a Docker container.

## Usage: ##

+ Place a file called `aws_example-inputs.yaml` under the root folder of this project, with contents:
```
aws_access_key_id: 'PUT_YOUR_KEY_HERE'
aws_secret_access_key: 'PUT_YOUR_SECRET_HERE'

# These are the key names in ec2 that will be created at bootstrap.
# If existing key pairs are used (see below), bootstrap will use the provided names, and will not create new ones.
manager_keypair_name: 'cloudify-manager-kp'
agent_keypair_name: 'cloudify-agent-kp'

use_existing_manager_group: true
use_existing_agent_group: true

# The bootstrap process creates 2 key pairs in order to connect to the management machine and application hosts.
# Set these properties to true (one or both) if you want to use existing key pairs, and not create new ones.
use_existing_manager_keypair: true
use_existing_agent_keypair: true

# These are the local paths where the key files will be created at bootstrap.
# If existing key pairs are used (see above), the key files should be at these paths for cloudify to find.
ssh_key_filename: '~/.ssh/cloudify-manager-kp.pem'
agent_private_key_path: '~/.ssh/cloudify-agent-kp.pem'

manager_security_group_name: 'sg-6324401f'
agent_security_group_name: 'sg-bd2440c1'
#manager_server_name: 'cloudify-manager-server'
```
+ Create the keypairs and security groups on aws as described above.
+ Make sure `cloudify-manager-kp.pem` and `cloudify-agent-kp.pem` are in the folder `keypairs`. Use correct permissions (`chmod 400`)
+ Execute `docker build . -t cloudify:latest`


## Credits ##

+ Andrew Taranik: [pureclouds](https://github.com/pureclouds/cloudify-docker)