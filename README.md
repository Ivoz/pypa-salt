PyPA Salt
=========

Bootstrap a Minion
==================

First you need to install the salt minion, you can do that with:

```console
# wget https://github.com/pypa/pypa-salt/raw/master/bootstrap/rpms/salt-2014.13.0.9c43e634b6d2c5df04bc98572e213f774f8de8f8-1.el6.noarch.rpm
# wget https://github.com/pypa/pypa-salt/raw/master/bootstrap/rpms/salt-minion-2014.13.0.9c43e634b6d2c5df04bc98572e213f774f8de8f8-1.el6.noarch.rpm
# yum localinstall salt-2014.13.0.9c43e634b6d2c5df04bc98572e213f774f8de8f8-1.el6.noarch.rpm
# yum localinstall salt-minion-2014.13.0.9c43e634b6d2c5df04bc98572e213f774f8de8f8-1.el6.noarch.rpm
# mkdir -p /etc/salt/minion.d
# wget https://github.com/pypa/pypa-salt/raw/master/bootstrap/configs/minion.conf -O /etc/salt/minion.d/local.conf
```

Then you need to edit ``/etc/salt/minion.d/local.conf`` to include the correct
roles for the minion you are bootstrapping.

Then you need to setup salt to connect to the master, you can do that with:

```console
# mkdir -p /etc/salt/pki/minion
# salt-key --gen-keys=local
# mv local.pem /etc/salt/pki/minion/minion.pem
# mv local.pub /etc/salt/pki/minion/minion.pub
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
# wget https://github.com/pypa/pypa-salt/raw/master/bootstrap/rpms/salt-2014.13.0.9c43e634b6d2c5df04bc98572e213f774f8de8f8-1.el6.noarch.rpm
# wget https://github.com/pypa/pypa-salt/raw/master/bootstrap/rpms/salt-master-2014.13.0.9c43e634b6d2c5df04bc98572e213f774f8de8f8-1.el6.noarch.rpm
# yum localinstall salt-2014.13.0.9c43e634b6d2c5df04bc98572e213f774f8de8f8-1.el6.noarch.rpm
# yum localinstall salt-master-2014.13.0.9c43e634b6d2c5df04bc98572e213f774f8de8f8-1.el6.noarch.rpm
# yum install GitPython
# mkdir -p /etc/salt/master.d
# wget https://github.com/pypa/pypa-salt/raw/master/bootstrap/configs/master.conf -O /etc/salt/master.d/local.conf
# chkconfig salt-master on
# service salt-master start
```

Future
======

Once SaltStack Helium has been released this should change to use the system
packages.
