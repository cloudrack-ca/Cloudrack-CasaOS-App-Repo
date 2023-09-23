# CasaOS Dockerized Grav

***

[`Check Out All Of The Cloudrack CasaOS Apps`](../)

***

## Important

* After Install please wait 1-5 minutes for the container to initialize and accept connections before attempting to install or exec commands inside the container.

```md
> Grav is a free software, self-hosted content management system (CMS) written in the PHP programming language and based on the Symfony web application framework. It uses a flat-file database for both backend and frontend.

Grav is designed to have a shallow learning curve and to be easy to set up. The focus of Grav is speed and simplicity, rather than an abundance of built-in features that come at the expense of complexity.
```

```md
# How To Use The App & or What's Included If Basic App
1.) Simply Install it, and go to your casaos or servers' publicly accessible IP address.
(and if you changed the default `80:` port and exposed port please make sure to navigate to that `IP.IP.IP.IP`:`port`.)
```

***

### Ports Used

```md
> | 80:80 |  
```

***

### Volumes Used

```yaml
    volumes:
      - type: bind
        source: /DATA/AppData/grav/config
        target: /config
```

> Explanation on how To change the source that data will be saved | say your storage is called `Storage1` and it is located on `/mnt` this would mean you would change

```yaml
        source: /DATA/AppData/grav/config
```

> To

```yaml
        source: /mnt/Storage1/DATA/AppData/grav/config
```
