PyPA Salt
=========

Bootstrap a Minion
==================

First you need to install the salt minion, you can do that with:

```console
# yum install salt-minion
# mkdir -p /etc/salt/minion.d
# wget https://github.com/pypa/pypa-salt/raw/master/bootstrap/configs/minion.conf -O /etc/salt/minion.d/local.conf
```

Then you need to edit ``/etc/salt/minion.d/local.conf`` to include the correct
roles for the minion you are bootstrapping.

Then you need to setup salt to connect to the master, you can do that with:

```console
# salt-call state.highstate  # Will raise an error
```

Then go onto the salt master and run:

```console
# salt-key -L  # Find the host name of the server you're connecting
# salt-key -a <hostname>
```

Finally you can come back to the new minion and run:

```console
# salt-call state.highstate
```


Bootstrap a Master
==================

```console
# yum install salt-master GitPython
# mkdir -p /etc/salt/master.d
# wget https://github.com/pypa/pypa-salt/raw/master/bootstrap/configs/master.conf -O /etc/salt/master.d/local.conf
# chkconfig salt-master on
# service salt-master start
```

Future
======

Once SaltStack Helium has been released and is in EPEL we can remove the git
syncing stuff in base.gitsync.
