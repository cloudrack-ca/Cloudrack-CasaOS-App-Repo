# CasaOS Dockerized (README TEMPLATE) - APP Name 
---
```md
> App Desciption.
```
```md
# How To Use The App & or What's Included If Basic App
- Step 1
- Step 2
- Step 3
```
---

### Ports Used
```md
> | 8880:8880 | 80:80 | 8443:8443 | 443:443 | 21:21 | 8447:8447 | < Are Examples | 
```
---

### Volumes Used
```yaml
# Example Dont Copy This Line And Remove It (Line - 22)
     volumes:
      - type: bind
        source: /DATA/AppData/sys/fs/cgroup
        target: /usr/bin:/sys/fs/cgroup
```
> Explanation on how To change the source that data will be saved | say your storage is called `Storage1` and it is located on `/mnt` this would mean you would change 
```yaml
        source: /DATA/AppData/sys/fs/cgroup
```
> To
```yaml
        source: /mnt/Storage1/DATA/AppData/sys/fs/cgroup
```
