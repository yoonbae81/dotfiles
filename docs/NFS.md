# Setting NFS

## Basic assumptions

- The NFS root is `/srv/nfs`.
- A share is located in `/etc/exports.d`.

## Server

- `/etc/exports.d/inbox.exports`:
```
/src/nfs/inbox 192.168.0.0/24(rw,sync)
```

- Re-export shared items:
```
# exportfs -arv
```

- To view the current loaded exports
```
# exportfs -v
```

- Enable Service
```
$ sudo systemctl enable nfs-server
```

