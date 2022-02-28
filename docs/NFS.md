# Setting NFS

## Basic assumptions

- The NFS root is `/srv/nfs`.
- A share is located in `/etc/exports.d`.

## Server

- Add directories exported to NFS clients and use `exportfs -arv` to reload.
```
# /etc/exports
/src/nfs 192.168.0.0/24(rw,sync,crossmnt,fsid=0)
```

- To view the current loaded exports
```
# exportfs -v
```

- Enable Service
```
# systemctl enable nfs-server
# systemctl start nfs-server
```


## Client

Prepare a directory to mount the exported.
```
# mkdir -p /mnt/[SERVER]
```

Mount 
```
# mount [SERVER]:/ /mnt/[SERVER]
```
