#!/bin/bash
LANGUAGE=$1
# Clone course repository
REPO_URL="https://github.com/InseeFrLab/funathon2023_sujet3.git"
CLONE_DIR="/home/onyxia/work/funathon-sujet3"
git clone --depth 1 $REPO_URL $CLONE_DIR
cd $CLONE_DIR

#!/bin/bash

# Check if the first parameter is "R"
if [[ $LANGUAGE == "R" ]]; then
    # Define the path to the package list file
    package_file="requirements_$LANGUAGE.txt"  # Replace with the path to your package list file

    # Read the package names from the file and install them
    while read -r package; do
        Rscript -e "if (!requireNamespace('$package', quietly = TRUE)) install.packages('$package')"
    done < "$package_file"
else
    pip install -r requirements_"$LANGUAGE".txt
fi

# Install required packages

# Open the relevant notebook when starting Jupyter Lab
jupyter server --generate-config
echo "c.LabApp.default_url = '/lab/tree/funathon-sujet3/Sujet_3_$LANGUAGE.ipynb'" >> /home/onyxia/.jupyter/jupyter_server_config.py
