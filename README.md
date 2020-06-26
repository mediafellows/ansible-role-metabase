[![Build Status](https://travis-ci.com/mediafellows/ansible-role-metabase.svg?branch=master)](https://travis-ci.com/mediafellows/ansible-role-metabase)

# Ansible Role Metabase

An Ansible role to install the [Metabase](https://www.metabase.com/) BI server software on a Linux server.

## Requirements

A Debian based Linux server running. As this role currently only uses apt for installing packages.

## Role Variables

Role variables you might want override:

- `metabase_port: 3000` - The port the Metabase deamon is listening on.
- `metabase_user: metabase` - The system user to use for running the Metabase deamon.
- `java_package: openjre-123` - The java package to install for Metabase, leave blank if you already have a working Java on that machine
- `metabase_settings_db_type: h2` - Change DB type for Metabase settings, for `posgres` und `mysql` type please also override connection details!

Find more variables in `defaults/main.yml`.

## Dependencies

Needs no other roles. You might wan to use other roles for installing a reverse Proxy webserver, like Nginx to front the Metabase server.

## Example Playbook

Include this in you playbook to run this role

```yaml
- name: My Play
  hosts: servers
  vars:
    metabase_port: 3001
  roles:
    - mediafellows.metabase
  tasks:
    # Other tasks
```

## License

BSD

## Author Information

By Stefan Horning <stefan.horning@mediafellows.com>
