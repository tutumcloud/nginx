tutum-docker-nginx
==================

Base Docker Image to run Nginx server


Usage
-----

To create the image `tutum/nginx`, execute the following command on the `tutum-docker-nginx` folder:

    docker build -t tutum/nginx .


Running your Nginx docker image
-------------------------------

Start your image building the external ports 80 in all interfaces to your container:

    docker run -d -p 80:80 tutum/nginx

Test your deployment:

    curl http://localhost/

Hello world!

Loading your custom PHP application
-----------------------------------

In order to replace the "Hello World" application that comes bundled with this docker images, first create a new empty folder. Go to the new folder and create two subfolders: `sites-enabled` and `app`. Copy your configuration files to `sites-enabled` and you application files to `app`. Then create a new `Dockerfile` with the following contents:

    FROM tutum/nginx
    ADD sites-enabled/ /etc/nginx/sites-enabled/
    ADD app/ /app/
    EXPOSE 80

Remember to put your configuration files under the folder named `sites-enabled` and your website files under the folder `app`. Also, if you want to use a different port, change the `EXPOSE 80` in `Dockerfile` as well.(eg. `EXPOSE 443 80` will allow connections go through port `443` and `80`).
After that, build the new `Dockerfile`:
    
    docker build -t username/my-nginx

And test it:

    docker run -d -P username/my-nginx

Test your deployment:

    curl http://localhost/

That's it!
