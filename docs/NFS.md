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

- Prepare a writable directory called `inbox`.
```
# mkdir -pv /srv/nfs/inbox
# chmod 777 /srv/nfs/inbox
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

Add mount options in `/etc/fstab`
```
# /etc/fstab
pi:/	/mnt/pi     nfs     noauto,noexec,rw,sync,user,noatime,nodiratime,timeo=900,retrans=5,_netdev 0 0
hp:/	/mnt/hp     nfs     noauto,noexec,rw,sync,user,noatime,nodiratime,timeo=900,retrans=5,_netdev 0 0
mx:/	/mnt/mx     nfs     noauto,noexec,rw,sync,user,noatime,nodiratime,timeo=900,retrans=5,_netdev 0 0
```

Mount 
```
# mount [SERVER]:/ /mnt/[SERVER]
```


