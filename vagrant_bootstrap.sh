#!/bin/bash

if [ ! -f /.vagrant_configured ]; then
  echo "starting one time configuration"
  ifup eth1
  echo "ifup eth1" >> /etc/rc.local
  setenforce 1
  sed -i 's/SELINUX=permissive/SELINUX=enforcing/' /etc/sysconfig/selinux
  chcon --reference /etc/sysconfig/network-scripts/ifcfg-eth0 /etc/sysconfig/network-scripts/ifcfg-eth1
  systemctl start firewalld
  systemctl enable firewalld
  firewall-cmd --add-interface=eth1 --zone=public
  touch /.vagrant_configured
fi
