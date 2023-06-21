#!/bin/bash

# Clone course repository
REPO_URL="https://github.com/InseeFrLab/funathon2023_sujet3.git"
CLONE_DIR="/home/onyxia/work/funathon-sujet3"
git clone --depth 1 $REPO_URL $CLONE_DIR
cd $CLONE_DIR

# Install required packages
pip install -r requirements_Python.txt

# Open the relevant notebook when starting Jupyter Lab
jupyter server --generate-config
echo "c.LabApp.default_url = '/lab/tree/funathon-sujet3/Sujet_3_Python.ipynb'" >> /home/onyxia/.jupyter/jupyter_server_config.py
