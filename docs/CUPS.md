



```

Listen 0.0.0.0:631
<Location />
    Order allow,deny
    Allow localhost
    Allow from 192.168.0.*
    Allow from 10.0.*.*
</Location>

<Location /admin>
    Order allow,deny
    Allow localhost
    Allow from 192.168.0.*
    Allow from 10.0.*.*
</Location>
```




### References
- https://serverfault.com/questions/836266/how-can-i-enable-remote-access-to-the-admin-page-in-cups
