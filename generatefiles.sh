#!/usr/bin/python3

import yaml
import subprocess

gitinstall = {'version': '3.6', 'services': {'gitlab': {'container_name': 'gitlab', 'image': 'gitlab/gitlab-ce:latest', 'restart': 'always', 'hostname': 'TestELB-559085542.us-east-1.elb.amazonaws.com', 'ports': ['80:80'], 'volumes': ['$GITLAB_HOME/config:/etc/gitlab', '$GITLAB_HOME/logs:/var/log/gitlab', '$GITLAB_HOME/data:/var/opt/gitlab']}}}

with open('docker-compose.yml', 'w') as f:

    data = yaml.dump(gitinstall, f)

playbook =  [{'name': 'Install docker on EC2', 'hosts': 'localhost', 'roles': [{'role': 'geerlingguy.docker', 'vars': {'docker_edition': 'ce', 'docker_package_state': 'present', 'docker_service_state': 'started', 'docker_service_enabled': True, 'docker_restart_handler_state': 'restarted', 'docker_install_compose': True}}]}]

with open('playbook.yml', 'w') as f:

    data = yaml.dump(playbook, f)



#subprocess.call('./checkimage.sh')
