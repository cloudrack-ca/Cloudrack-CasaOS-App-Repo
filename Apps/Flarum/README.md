# Flarum Readme
---
#### [`Check Out All Of The Cloudrack CasaOS Apps`](https://github.com/cloudrack-ca/Cloudrack-CasaOS-App-Repo/blob/main/Apps/README.md) | [`See App`](https://github.com/cloudrack-ca/Cloudrack-CasaOS-App-Repo/tree/main/Apps/Flarum)
- The README is currently a WIP please come check back later.
Please note if you are eager and want to attempt to use this image/app then please note you will need to wait 1-5 minutes after initially bringing the containers up or installing the app on CasaOS.
- you **WILL** need to set the database host on install to your containers intenal ip address you can obtain this by exec into the app/container and run `ip a` & database port `IPaddress:DBPort#` 
---
## Install custom extensions
- Flarum extensions list : https://flagrow.io/extensions
### Install an extension
```docker exec -ti flarum extension require some/extension```
### Remove an extension
```docker exec -ti flarum extension remove some/extension```
### List all extensions
```docker exec -ti flarum extension list```
> you will need to exec ether into the shell with example commands below or if you are using CasaOS please use `cd /flarum` and then run your install with `composer require some/extension`
