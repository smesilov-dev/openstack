#!/bin/bash
su -s /bin/sh -c "keystone-manage db_sync" keystone && \
  keystone-manage credential_setup --keystone-user keystone --keystone-group keystone && \
  keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone
