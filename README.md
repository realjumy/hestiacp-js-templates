# HestiaCP JavaScript templates

## Careful! This is still in development and will probably break your server.

Python templates for [HestiaCP](https://www.hestiacp.com/).

This project was originally based on the work done by [anton-bozhina](https://github.com/anton-bozhina) and [refsigregory](https://github.com/refsigregory/vestacp-python-template/commits?author=refsigregory). However, a new approach has been taken.

## Disclaimer

1. This code comes without warranty of any kind. Please refer to `README.md` for more details about this and the license to which this software is bounded. 
2. All this is still in experimental stage.
3. These templates will install the applications **in debug mode and without database connection**. Is therefore your responsibility to complete the configuration process and make the app safe.

## Requirements

- HestiaCP
- Ubuntu >=18.04

I presume it can be adapted to VestaCP after small modifications.

## Tested with

- [X] HestiaCP 1.1.1
- [X] Ubuntu 18.04


If you have tested it with a different version or different distro, feel free to contact me to provide feedback.

## Instructions for Ubuntu:

1. __Make sure you have an updated backup of your system and that it can go into maintenance if necessary__.
2. Install NodeJS and NPM
```bash
sudo apt update
sudo apt upgrade
cd ~
sudo sudo apt install curl dirmngr apt-transport-https lsb-release ca-certificates
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install nodejs
sudo apt install gcc g++ make
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn
sudo npm install ghost-cli@latest -g
```
2. Install Docker and Docker-compose
```bash
sudo apt update
sudo curl -sL https://get.docker.com | sh
# This next line is a security risk in a multi-users environment. Skip it if your server is used by several users.
sudo usermod -aG docker admin
sudo curl -L https://github.com/docker/compose/releases/download/1.25.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

3. Download the templates to the correct location:

- Apache2 templates goes into `/usr/local/hestia/data/templates/web/apache2/php-fpm/`
- Chage he permissions to `.sh` files using the command `chmod +x *.sh` in the `/usr/local/hestia/data/templates/web/apache2/php-fpm/` folder.
- NGINX templates goes into `/usr/local/hestia/data/templates/web/nginx/`

4. Activate the template NGINX proxy template

5. Activate the desired Apache2 template. It is recommended to set the backend template to `no-php`.

6. Complete the setup process of the terminal. This includes setting up the database, adding the users, disabling the debug/setting environment to production, modifying the allowed hosts, and so on.
