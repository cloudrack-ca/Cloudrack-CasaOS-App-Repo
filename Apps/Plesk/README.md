# CasaOS Dockerized - Plesk

***

[`Check Out All Of The Cloudrack CasaOS Apps`](../)

***

```md
> Plesk provides web administrators, application developers, web professionals, hosting service providers, and infrastructure providers a ready-to-code environment to build targeted solutions on.
```

```md
- Manage plans, subscriptions, accounts, and resellers
- Create domains, sub-domains, and domain aliases
- Easily set up email addresses, email forwarding, and email filters
- Configure databases from a simple web interface
- One-click install and mass-management of WordPress.
- Uses a port mapped to `8880` to access the control panel.
- Access a scalable and flexible platform
- Migrate legacy platforms
- Standardize shared hosting infrastructure
- Unify User Experience and enable Mobile
```

***

### Ports Used

```md
> | 8880:8880 | 80:80 | 8443:8443 | 443:443 | 21:21 | 8447:8447 |
```

***

### Volumes Used

```yaml
     volumes:
      - type: bind
        source: /DATA/AppData/sys/fs/cgroup
        target: /usr/bin:/sys/fs/cgroup
```

> To change the source that data will be saved say your storage is called `Storage1` and its located on `/mnt` this would mean you would change

```yaml
        source: /DATA/AppData/sys/fs/cgroup
```

> To

```yaml
        source: /mnt/Storage1/DATA/AppData/sys/fs/cgroup
```
