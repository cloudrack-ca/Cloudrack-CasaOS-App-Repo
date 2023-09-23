# CasaOS Dockerized - SpeedTest Tracker

***

[`Check Out All Of The Cloudrack CasaOS Apps`](../)

***

```md
# Run A Speedtest Every Hour And Graph The Results. See Https://hub.docker.com/r/henrywhitaker3/speedtest-tracker/tags For Arch Options
```

```md
# How To Use The App & or What's Included If Basic App
- Install & Go To Destination `http://IP:8765`
```

***

```md
> | 8765:80 | Exposed Port = 8765
```

***

### Volumes Used

```yaml
# Example Dont Copy This Line And Remove It (Line - 22)
    volumes:
      - type: bind
        source: /DATA/AppData/$AppID/config
        target: /config
```

> Explanation on how To change the source that data will be saved | say your storage is called `Storage1` and it is located on `/mnt` this would mean you would change

```yaml
        source: /DATA/AppData/$AppID/config
```

> To

```yaml
        source: /mnt/Storage1/DATA/AppData/$AppID/config
```

### Credits

> LinuxServer.io Team For Inital Configuration.
