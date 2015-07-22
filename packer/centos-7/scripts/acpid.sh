#!/bin/bash

# to enable ACPI event handling (useful for poweroff events)

yum install -y acpid
systemctl enable acpid
systemctl start acpid
