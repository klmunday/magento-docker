# magento-docker
A docker image for use in docker-composer environments and local magento files.
*This is for use with Magento's Full Release files available from: [https://magento.com/tech-resources/download](https://magento.com/tech-resources/download)*

## Instructions
1. Download Magento full release files from [here](https://magento.com/tech-resources/download).
2. Clone repo `git clone https://github.com/klmunday/magento-docker.git`.
3. Unpack magento files into `/magento-files`.
4. Build docker container `docker build -t magento .`.
5. Run `docker-compose up`.
6. Visit `127.0.0.1:8000` for Magento website.

A PhpMyAdmin interface is also available at `127.0.0.1:1234` for database interaction.

## Credentials
* MySQL root user: `root`
* MySQL root password: `letmein`
* Magento Admin username: `admin`
* Magento Admin password: `admin123`
* use MySQL credentials for PhpMyAdmin*
