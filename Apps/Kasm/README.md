# CasaOS Dockerized - Kasm 
---

> [`Check Out All Of The Cloudrack CasaOS Apps`](https://github.com/cloudrack-ca/Cloudrack-CasaOS-App-Repo/blob/main/Apps/README.md) | [`See App`](https://github.com/cloudrack-ca/Cloudrack-CasaOS-App-Repo/tree/main/Apps/Kasm)

> Streaming containerized apps and desktops to end-users. The Workspaces platform provides enterprise-class orchestration, data loss prevention, and web streaming technology to enable the delivery of containerized workloads to your browser.

---

> 1. Go to https://`ip.ip.ip.ip`:3022 to install and setup kasm then go to https://`ip.ip.ip.ip` and login with your [Default Logins](https://github.com/cloudrack-ca/Cloudrack-CasaOS-App-Repo/blob/main/Apps/Kasm/README.md#default-logins)
> 2. Please remember to change `ip.ip.ip.ip` with your server/containers actual public accessible IP address.
> - Uses a port mapped to `3022` to access the control panel to install kasm.
> - Once kasm is installed it uses a port mapped to port `443` to access kasm read below.

---

### Default logins
> - `admin@kasm.local` & `password you chose on install`
> - `user@kasm.local` & `password you chose on install`
### Ports Used
> `3022:3000` | `443:443` 

---
### Volumes Used

```yaml
    volumes:
      - type: bind
        source: /DATA/AppData/Kasm/data
        target: /opt
      - type: bind
        source: /DATA/AppData/Kasm/profiles
        target: /profiles
```

> to change the source that data will be saved say your storage is called `Storage1` and it is located on `/mnt` this would mean you would change 

```yaml
        source: /DATA/AppData/Kasm/data
```

> To

```yaml
        source: /mnt/Storage1/DATA/AppData/Kasm/data
```

> & this would be the same for the other volume also change

```yaml
        source: /DATA/AppData/Kasm/profiles
```

> To

```yaml
        source: /mnt/Storage1/DATA/AppData/Kasm/profiles
```
