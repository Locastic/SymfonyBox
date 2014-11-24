#Vagrant box built with Ansible for Symfony2 framework

This box was based on Erika Heidi's vagrantee box:
[link](https://github.com/vagrantee/sandbox-symfony)

## Pre-requisites

### Ansible

For OSX use Homebrew:

    brew update
    brew install ansible

For other operating systems check:
[ansible installation](http://docs.ansible.com/intro_installation.html)

### Vagrant

Download and Install Vagrant:
[download vagrant](https://www.vagrantup.com/)

## Features

* CentOS 6.5
* LAMP with PHP 5.4.33
* Composer
* HHVM
* Nodejs, NPM, LESS
* ElasticSearch
* TMUX

## Installation

    git clone https://github.com/KrunoKnego/SymfonyVagrantAnsibleBox.git
    vagrant up

## How to start a project

You can easily start a project by running vagrantee.sh script.
All details can be found on the following 
[link](https://github.com/vagrantee/sandbox-symfony)

