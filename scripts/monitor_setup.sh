#!/bin/bash

if service --status-all | grep -Fq 'datadog-agent'; then    
    echo "datadog-agent is installed"
else
    DD_AGENT_MAJOR_VERSION=7 DD_API_KEY=$DD_API_KEY bash -c "$(curl -L https://raw.githubusercontent.com/DataDog/datadog-agent/master/cmd/agent/install_script.sh)"
fi

DD_CONFIG_FOLDER=/etc/datadog-agent/conf.d/docker.d
DD_DOCKER_SETTING_FILE=docker_daemon.yaml

# Config docker agent
sudo usermod -a -G docker dd-agent

# Setting file
sudo touch $DD_CONFIG_FOLDER/$DD_DOCKER_SETTING_FILE

echo "init_config:

instances:
    - url: \"unix://var/run/docker.sock\"
      new_tag_names: true" | sudo tee $DD_CONFIG_FOLDER/$DD_DOCKER_SETTING_FILE 

# Restart data dog
sudo service datadog-agent restart
