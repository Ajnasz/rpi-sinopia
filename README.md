## Sinopia (Docker Image)

Sinopia is a private npm repository server

### Installing Image

`docker pull ajnasz/rpi-sinopia

### Creating Container

`docker run --name sinopia -d -p 4873:4873 ajnasz/rpi-sinopia`

### Setting Registry

`npm set registry http://<docker_host>:4873/`

### Determining Username and Password

`docker logs sinopia`

### Modify configuration

```
 # Save the config file
curl -L https://raw.githubusercontent.com/rlidwka/sinopia/master/conf/full.yaml -o /path/to/config.yaml
 # Mount the config file to the exposed data volume
docker run -v /path/to/config.yaml:/opt/sinopia/config.yaml --name sinopia -d -p 4873:4873 drewwells/sinopia
```

Restart the container anytime you change the config.

### Backups

```bash
mkdir backup
 # make the backup folder writable, if you are not root
chmod 777 backup
docker run --volumes-from sinopia -v $(pwd):/backup ajnasz/rpi-sinopia tar cvf /backup/backup.tar /opt/sinopia
```

Alternatively, host path for /opt/sinopia can be determined by running:

`docker inspect sinopia`

### Restore

```
docker stop sinopia
docker rm sinopia
docker run --name sinopia -d -p 4873:4873 ajnasz/rpi-sinopia
docker stop sinopia
docker run --volumes-from sinopia -v $(pwd):/backup ajnasz/rpi-sinopia tar xvf /backup/backup.tar
docker start sinopia
```

## Links

* [Sinopia on Github](https://github.com/rlidwka/sinopia)
