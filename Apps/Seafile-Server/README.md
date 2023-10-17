# CasaOS Dockerized Seafile Server

***

[`Check Out All Of The Cloudrack CasaOS Apps`](../)

***

## Important

* After Install please wait 1-5 minutes for the container to initialize and accept connections before attempting to install or exec commands inside the container.

```md
> Seafile is an open-source file sync and share solution designed for high reliability, performance, and productivity. It allows users to sync, share, and collaborate across devices and teams. Seafile provides features similar to Dropbox, Google Drive, and Office 365, while allowing users to host the server on their own hardware.
```

```md
# How To Use The App & or What's Included If Basic App
1.) Simply Install it, and go to your casaos or servers' publicly accessible IP address.
(and if you changed the default `8022:` port and exposed port please make sure to navigate to that `IP.IP.IP.IP`:`port`.)
```
# Installation of applications
> You may install the Seafile Desktop client or phone client found on the offical website [https://www.seafile.com/en/download/](https://www.seafile.com/en/download/) more or less allowing you to sync your data to your casa.
***

### Ports Used

```md
> | 8022:80 |  
```

***

### Volumes Used
For Seafile Web App
```yaml
    volumes:
      - type: bind
        source: /DATA/AppData/Seafile/opt/seafile-data
        target: /shared
```
For Database
```yaml
    volumes:
      - type: bind
        source: /opt/seafile-mysql/db
        target: /var/lib/mysql
```

> Explanation on how To change the source that data will be saved | say your storage is called `Storage1` and it is located on `/mnt` this would mean you would change

```yaml
        source: /DATA/AppData/Seafile/opt/seafile-data
```

> To

```yaml
        source: /mnt/Storage1/DATA/AppData/Seafile/opt/seafile-data
```
