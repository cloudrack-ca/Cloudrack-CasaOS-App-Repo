# CasaOS Dockerized - Humhub
---
> [`Check Out All Of The Cloudrack CasaOS Apps`](https://github.com/cloudrack-ca/Cloudrack-CasaOS-App-Repo/blob/main/Apps/README.md) | [`See App`](https://github.com/cloudrack-ca/Cloudrack-CasaOS-App-Repo/tree/main/Apps/Humhub)

```md
> HumHub is a free and open-source social network software written on top of the Yii PHP framework that provides an easy to use toolkit for creating and launching your own social network.
```
```md
# How To Use The App & or What's Included If Basic App
```
1. install the app and then go to http://`ip.ip.ip.ip`:`8081` if you changed your default port from `8081` please make sure to change this as well `ip.ip.ip.ip` = your exposed public IP address.
2. during database installation make sure to set the hostname to `db` and set your `db` port to `3306` or leave it empty if you changed this port make sure to change it to the port you have chosen for the `db` make sure to set the username to `humhub` as well as password to `humhub` or whatever you have chosen for your configuration.
3. perform install - please note you may get timed out for a bit this is due to the humhub installation taking time to complete install, please give it time if it does display a timeout error when accessing your humhub installation also if you can not get past the `next` button during installation this means that humhub is still installing give it around 1-5-10 minutes max go back to the installer window and click `next` you should now be brought to your configuration to setup your humhub installation!
---

### Ports Used
```md
> | 8081:80 | 3306:3306 | 
```
---

### Volumes Used Humhub App
```yaml
    volumes:
      - type: bind
        source: /DATA/AppData/$AppID/var/www/localhost/htdocs/protected/config
        target: /var/www/localhost/htdocs/protected/config
      - type: bind
        source: /DATA/AppData/$AppID/var/www/localhost/htdocs/uploads
        target: /var/www/localhost/htdocs/uploads
      - type: bind
        source: /DATA/AppData/$AppID/var/www/localhost/htdocs/protected/modules
        target: /var/www/localhost/htdocs/protected/modules
      - type: bind
        source: /DATA/AppData/$AppID/var/www/localhost/htdocs/uploads/profile_image
        target: /var/www/localhost/htdocs/uploads/profile_image
```
### Volumes Used For Humhub DB
```yaml
    volumes:
      - type: bind
        source: /DATA/AppData/$AppID/var/lib/mysql
        target: /var/lib/mysql
```
> Explanation on how To change the source that data will be saved | say your storage is called `Storage1` and it is located on `/mnt` this would mean you would change 
```yaml
        source: /DATA/AppData/$AppID/var/www/localhost/htdocs/protected/config
```
> To
```yaml
        source: /mnt/Storage1/DATA/AppData/$AppID/var/www/localhost/htdocs/protected/config
```
> In some situations (e.g. with [podman-compose](https://github.com/containers/podman-compose)) you have to run compose `up` twice to give it some time to create the named volumes.

## Advanced Config

This container supports some further options which can be configured via environment variables. Look at the [docker-compose.yml](https://github.com/mriedmann/humhub-docker/blob/master/docker-compose.yml) for some inspiration.

### Database Config

To avoid the visual installer at the first startup, set the HUMHUB_DB_PASSWORD **and** HUMHUB_DB_USER.
If you use the `--link` argument please specify the name of the link as host (via `HUMHUB_DB_HOST`) or use `db` as linkname ( `--link <container>:db` ).

```plaintext
HUMHUB_DB_USER     []
HUMHUB_DB_PASSWORD []
HUMHUB_DB_NAME     [humhub]
HUMHUB_DB_HOST     [db]
```

### Autoinstall Config

```plaintext
HUMHUB_AUTO_INSTALL [false]
```

If this and `HUMHUB_DB_USER` are set an automated installation will run during the first startup. This feature utilities a hidden installer-feature used for integration testing ( [see code file](https://github.com/humhub/humhub/blob/master/protected/humhub/modules/installer/commands/InstallController.php) ).

```plaintext
HUMHUB_PROTO [http]
HUMHUB_HOST  [localhost]
```

If these are defined during auto-installation, HumHub will be installed and configured to use URLs with those details. (i.e. If they are set as `HUMHUB_PROTO=https`, `HUMHUB_HOST=example.com`, HumHub will be installed and configured so that the base URL is `https://example.com/`. Leaving these as default will result in HumHub being installed and configured to be at `http://localhost/`.

```plaintext
HUMHUB_ADMIN_LOGIN    [admin]
HUMHUB_ADMIN_EMAIL    [humhub@example.com]
HUMHUB_ADMIN_PASSWORD [test]
```

If these are defined during auto-installation, HumHub admin will be created with those credentials.

### Startup Config

```plaintext
INTEGRITY_CHECK [1]
```

This can be set to `"false"` to disable the startup integrity check. Use with caution!

```plaintext
WAIT_FOR_DB [1]
```

Can be used to let the startup fail if the db host is unavailable. To disable this, set it to `"false"`. Can be useful if an external db-host is used, avoid when using a linked container.

```plaintext
SET_PJAX [1]
```

PJAX is a jQuery plugin that uses Ajax and pushState to deliver a fast browsing experience with real permalinks, page titles, and a working back button. ([ref](https://github.com/yiisoft/jquery-pjax)) This library is known to cause problems with some browsers during installation. This container starts with PJAX disabled to improve the installation reliability. If this is set (default), PJAX is **enabled** during the **second** startup. Set this to `"false"` to permanently disable PJAX. Please note that changing this after container-creation has no effect on this behavior.

### Mailer Config

It is possible to configure HumHub email settings using the following environment variables:

```plaintext
HUMHUB_MAILER_SYSTEM_EMAIL_ADDRESS    [noreply@example.com]
HUMHUB_MAILER_SYSTEM_EMAIL_NAME       [HumHub]
HUMHUB_MAILER_TRANSPORT_TYPE          [php]
HUMHUB_MAILER_HOSTNAME                []
HUMHUB_MAILER_PORT                    []
HUMHUB_MAILER_USERNAME                []
HUMHUB_MAILER_PASSWORD                []
HUMHUB_MAILER_ENCRYPTION              []
HUMHUB_MAILER_ALLOW_SELF_SIGNED_CERTS []
```

### LDAP Config

It is possible to configure HumHub LDAP authentication settings using the following environment variables:

```plaintext
HUMHUB_LDAP_ENABLED                               [0]
HUMHUB_LDAP_HOSTNAME                              []
HUMHUB_LDAP_PORT                                  []
HUMHUB_LDAP_ENCRYPTION                            []
HUMHUB_LDAP_USERNAME                              []
HUMHUB_LDAP_PASSWORD                              []
HUMHUB_LDAP_BASE_DN                               []
HUMHUB_LDAP_LOGIN_FILTER                          []
HUMHUB_LDAP_USER_FILTER                           []
HUMHUB_LDAP_USERNAME_ATTRIBUTE                    []
HUMHUB_LDAP_EMAIL_ATTRIBUTE                       []
HUMHUB_LDAP_ID_ATTRIBUTE                          []
HUMHUB_LDAP_REFRESH_USERS                         []
HUMHUB_ADVANCED_LDAP_THUMBNAIL_SYNC_PROPERTY      [thumbnailphoto]
```

### PHP Config

It is also possible to change some php-config-settings. This comes in handy if you have to scale this container vertically.

Following environment variables can be used (default values in angle brackets):

```plaintext
PHP_POST_MAX_SIZE       [16M]
PHP_UPLOAD_MAX_FILESIZE [10M]
PHP_MAX_EXECUTION_TIME  [60]
PHP_MEMORY_LIMIT        [1G]
PHP_TIMEZONE            [UTC]
```

### NGINX Config

Following variables can be used to configure the embedded Nginx. The config-file gets rewritten on every container startup and is not persisted. Avoid changing it by hand.

```plaintext
NGINX_CLIENT_MAX_BODY_SIZE [10m]
NGINX_KEEPALIVE_TIMEOUT    [65]
HUMHUB_REVERSEPROXY_WHITELIST ["127.0.0.1"]
```

`HUMHUB_REVERSEPROXY_WHITELIST` allows access to the `/ping` endpoint for the given IP-Address. CIDR notation is supported.
