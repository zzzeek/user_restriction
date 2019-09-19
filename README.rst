Database User per Controller - Openstack TripleO
================================================

This is an Ansible playbook that can be run against
a Red Hat Openstack Director installation based on TripleO.

The playbooks only work on containerized TripleO and have
been tested against plain OSP13 and OSP15 installations
so far.

instructions:

1. The files should be checked out onto a host that has Ansible
   installed in $PATH, as well as has password-less ssh access
   to the controller nodes.

2. enter IP addresses of controller nodes into the ``hosts`` file
   (that is, the Ansible inventory file), replacing the sample
   addresses currently present.

3. View the Ansible tasks which will run::

    ./deploy.sh install --list-tasks

4. View Ansible tags which can be used to limit the steps taken
   by an install run::

    ./deploy.s install --list-tags

5. to run fully::

    ./deploy.sh install

6. to revert, which will run all the steps in reverse order::

   ./deploy.sh revert


