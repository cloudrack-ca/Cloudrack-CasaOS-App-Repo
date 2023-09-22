# CasaOS Dockerized - Wordpress

---
> [`Check Out All Of The Cloudrack CasaOS Apps`](https://github.com/cloudrack-ca/Cloudrack-CasaOS-App-Repo/blob/main/Apps/README.md) | [`See App`](https://github.com/cloudrack-ca/Cloudrack-CasaOS-App-Repo/tree/main/Apps/Wordpress)

> Install With Docker Compose, please give the database time to setup and configure, if you decide to go to your WordPress site to install right away and are faced with a db connection error please wait anywhere from 1-5 minutes and try refreshing the page again to perform the install.
> > Keep in mind that this `docker-compose.yaml` is only a template and you can use it but should know what you are doing first with docker.
> >
> >
> > >  Default Port `:8880`
> > > > Make sure to change `source:` to your preferred location for files this way you can keep persistent data.
---
> You may change the default database configurations to your liking
```
 environment:
      - MYSQL_DATABASE=database
      - MYSQL_PASSWORD=password
      - MYSQL_ROOT_PASSWORD=rootpass
      - MYSQL_USER=username
```
> Remember that if you change the default port for `db:` from `3306` or any of the other default provided `MYSQL_` configurations like `MYSQL_DATABASE` or `MYSQL_PASSWORD` you will also need to configure your `DB` `environment` which looks like the below one.
> You can find the following `environment` below inside the `docker-compose.yaml` file above the line labeled `image: wordpress:latest`
```
environment:
      - WORDPRESS_DB_HOST=db:3306
      - WORDPRESS_DB_NAME=database
      - WORDPRESS_DB_PASSWORD=password
      - WORDPRESS_DB_USER=username
```
---
### Notes: 

1. do not change the hostname `db:3306` which we mean is the `db:` part this is crucial to this script working when we talk about changing the default port above for the `db` we want you to just change out the numbers on the right side of `db:3306` with your port number you have selected as your MySQL port.
2. The field known as `hostname:` shows the IP address `10.0.0.202` Make sure to set the IPv4 to your server's public or private ip if on a local network.

---

### PHP.INI Configuration setup

---

> To configure `php.ini` to allow for bigger file uploads you will need to exec into the container if you are on CasaOS select the 3 dots located when you hover over top of the app square on your CasaOS dashboard (image below) then select `settings` once the settings pop-up window opens you will see `db` & `wordpress` select `wordpress`

> <img src="https://i.ibb.co/gMMkGwP/image.png">

> <img src="https://i.ibb.co/gZCygr8/image.png">

> <img src="https://i.ibb.co/jyrWtsJ/image.png">

> Once you have selected `wordpress` please press the button that looks like so on the pop-up windows

> <img src="https://i.ibb.co/RvM5QTQ/image.png">

> once you have selected this button a new window will display which will grant you access to a shell to control this `wordpress` container.
> once inside the container and in shell you will need to type the command `php --ini` to display the following

> <img src="https://i.ibb.co/s51ZYDL/image.png">

> you will see the following
```
# php --ini
Configuration File (php.ini) Path: /usr/local/etc/php
Loaded Configuration File:         (none)
Scan for additional .ini files in: /usr/local/etc/php/conf.d
Additional .ini files parsed:      /usr/local/etc/php/conf.d/docker-php-ext-bcmath.ini,
/usr/local/etc/php/conf.d/docker-php-ext-exif.ini,
/usr/local/etc/php/conf.d/docker-php-ext-gd.ini,
/usr/local/etc/php/conf.d/docker-php-ext-imagick.ini,
/usr/local/etc/php/conf.d/docker-php-ext-intl.ini,
/usr/local/etc/php/conf.d/docker-php-ext-mysqli.ini,
/usr/local/etc/php/conf.d/docker-php-ext-opcache.ini,
/usr/local/etc/php/conf.d/docker-php-ext-sodium.ini,
/usr/local/etc/php/conf.d/docker-php-ext-zip.ini,
/usr/local/etc/php/conf.d/error-logging.ini,
/usr/local/etc/php/conf.d/opcache-recommended.ini
```
> As you can see the line for `Loaded Configuration File:` states `(none)` means we need `vim` or `nano` I prefer `nano` myself, as `nano` is not installed in this container I need to simply run the command `apt update && apt install nano -y` this will update the repositories inside the `wordpress` container and will also install `nano` shell file editor. From here I will need to now make a file called `php.ini` and I need to put this file inside the directory known as `/usr/local/etc/php/` so the command would simply be `nano /usr/local/etc/php/php.ini` this will make a file called `php.ini` but we still need to fill in the configurations and inside of this file we will paste the following below.

```
max_execution_time = 180
memory_limit = 128M
post_max_size = 64M
upload_max_filesize = 64M
max_input_time = 60
file_uploads = On
safe_mode = Off
```
- tip you can press `crtl+shift+v` inside of a CasaOS-contained shell to simply paste the above.
  
> This is the default recommended `php.ini` configuration from [Jetpack themselves found here](https://jetpack.com/blog/wordpress-php-ini/)
> Once you have added this config format for `php.ini` simply press `crtl+x` to exit and when asked to save with `y` or `n` press `y`,
> - if asked write a file name for this file remember to call it `php.ini`
> Now that we have made the `php.ini` file with the configurations for our WordPress install we are going to want to double-check now that our `php.ini` file is now found so we are going to once again type the command inside of the same WordPress container `php --ini` you should now see the following below
```
# php --ini
Configuration File (php.ini) Path: /usr/local/etc/php
Loaded Configuration File:         /usr/local/etc/php/php.ini
Scan for additional .ini files in: /usr/local/etc/php/conf.d
Additional .ini files parsed:      /usr/local/etc/php/conf.d/docker-php-ext-bcmath.ini,
/usr/local/etc/php/conf.d/docker-php-ext-exif.ini,
/usr/local/etc/php/conf.d/docker-php-ext-gd.ini,
/usr/local/etc/php/conf.d/docker-php-ext-imagick.ini,
/usr/local/etc/php/conf.d/docker-php-ext-intl.ini,
/usr/local/etc/php/conf.d/docker-php-ext-mysqli.ini,
/usr/local/etc/php/conf.d/docker-php-ext-opcache.ini,
/usr/local/etc/php/conf.d/docker-php-ext-sodium.ini,
/usr/local/etc/php/conf.d/docker-php-ext-zip.ini,
/usr/local/etc/php/conf.d/error-logging.ini,
/usr/local/etc/php/conf.d/opcache-recommended.ini
```
> As we can see our `Loaded Configuration File:` now has a path set instead of showing `(none)` we can see that it shows `/usr/local/etc/php/php.ini`

**IMPORTANT** Once you have done all this above you are going to want to restart your WordPress container you can do this inside of CasaOS by following the below
> 1. Click the three dots located on the app button
> 
> <img src="https://i.ibb.co/gMMkGwP/image.png">
> 
> 2. Once you see the mini pop-up menu for the app in this case `wordpress` head to step `#3` below.
>
> <img src="https://i.ibb.co/gZCygr8/image.png">
> 
> 3. Then click on the button that looks like the button below
>    
> <img src="https://i.ibb.co/tKqJH3L/image.png">

> Once you do this your WordPress install will now run with the provided `php.ini` configurations.

#### That's it Enjoy!

### Credits
---
Just some guy in Canada. 
> `storm_moran` on discord
