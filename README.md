## Playbook for creating a Mesos, Marathon, Docker and Weave PaaS using Ansible

This is a playbook will deploy clusters utilizing the following technologies:

- Oracle Java 8 for Mesos and Zookeeper
- Apache Mesos for task scheduling
- Docker for common container platform
- Marathon for long running service orchestration
- Chronos for time and dependency based task scheduling
- Weave for overlay networking, IPAM, and DNS

This playbook supports 1..N Mesos Master nodes and 1..N Mesos slave based nodes.

### Additional Documentation

My attempted revamp of a project first created by Jeremy Unruh. The idea is to
keep the core Mesos, Marathon, Chronos, Docker, Weave, and Zookeeper intact.

See his blog entry and series related to this playbook at: [Eating my own Dog Food: Building a PaaS](http://jbu.io/2016/04/05/eating-my-own-dog-food-building-a-paas/)

## Using this playbook with Vagrant

Out of the box after cloning this repo a simple ```vagrant up``` will create a 3 Master and 3 Slave cluster.  This cluster will create a weave network for docker to docker multi-host networking with a DNS name of *.mycompany.local.  

#### To customize the number of agents and attribution

1. Run ```vagrant up```

