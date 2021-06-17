#### Configure ssh for a new VM ####
# gcloud compute config-ssh

#### Inside of VM ####
# install pathogen for vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install wget
sudo apt-get install wget

# install miniconda from https://docs.conda.io/en/latest/miniconda.html
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
source ~/.bashrc
conda config --set auto_activate_base false

# install gcloud
read -r -p "☁️ Install gcloud? [Yes/no]" response
response=${response}
if [[ $response =~ ^(Yes|yes|y| ) ]] || [[ -z $response ]]; then
  if ! (hash gcloud 2>/dev/null); then
    echo "Installing gcloud..."
    echo "export PATH=$SECANT_INSTALL/google-cloud-sdk/bin:$PATH" >> ~/.zshrc
    source ~/.zshrc
    PWD=$(pwd)
    cd $SECANT_INSTALL
    curl --retry 10 -sSL https://sdk.cloud.google.com | bash
    gcloud auth application-default login
    yes '' | gcloud alpha auth login
    cd $PWD
  else
    echo "gcloud already installed."
  fi
fi

# install git and set up Github ssh keys: https://docs.github.com/en/enterprise/2.15/user/articles/adding-a-new-ssh-key-to-your-github-account
sudo apt install git build-essential

# install linter and formatter for local and vscode remote
pip install yapf

# create environment then install dependencies
conda create -n python37 python=3.7

# run other configs
echo provider = '"gcp"' > /home/$USER/cloud.toml
gcloud auth application-default login
gcloud auth login
