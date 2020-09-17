#! /bin/bash

#sudo apt update && sudo apt install git -y && git config --global user.email "drakof@awesome.com" && git config --global user.name "drakof"

echo '----Begin Setup----'
#Basic Setup
sudo passwd

sudo apt -y update && sudo apt -y upgrade && sudo apt -y autoremove

#install python3
if [ -r /usr/bin/python3 ]
then
    echo 'Python 3 is already installed'
else
    echo 'Installing Python 3'
    sudo apt install python3
fi

#install VS Code
if [ -r /usr/bin/code ]
then
    echo 'VS Code is already installed'
else
    echo 'Installing VS Code'
    sudo apt -y update
    sudo apt -y install software-properties-common apt-transport-https wget
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt -y update
    sudo apt -y install code

fi

#install PIP3
if [ -r /usr/bin/pip3 ]
then
    echo 'PIP3 is already installed'
else
    echo 'Installing PIP3'
    sudo apt install python3-pip -y
    sudo -H pip3 install --upgrade pip
fi

#install Jupyter Notebook
if [ -r /usr/bin/jupyter-notebook ]
then
    echo 'Jupyter Notebook is already installed'
else
    echo 'Installing Jupyter Notebook'
    sudo apt install jupyter-notebook -y
    echo 'Setting up Jupyter Notebook extensions'
    sudo pip3 install jupyter_contrib_nbextensions
    sudo jupyter contrib nbextension install
    sudo jupyter nbextension enable codefolding/main
fi

#install other relevant packages
sudo pip3 install numpy
sudo pip3 install pandas
sudo pip3 install pandas_datareader
sudo pip3 install scipy
sudo pip3 install tensorflow
sudo pip3 install keras
sudo pip3 install theano
sudo pip3 install matplotlib
sudo pip3 install scikit-learn
sudo pip3 install bokeh
sudo pip3 install boto3
sudo pip3 install python-digitalocean
sudo pip3 install seaborn
sudo pip3 install torch

echo 'Setup Completed Successfully'
