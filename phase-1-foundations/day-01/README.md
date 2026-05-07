# Day 1: Filesystem & Permissions

## Objectives
- Understand the Linux filesystem hierarchy (`/etc`, `/var/log`, `/proc`, `/sys`).
- Master Linux file permissions (`chmod`, `chown`, octal values).
- Understand special permissions like SUID and SGID and their security implications.
- Automate user and group provisioning with a Bash script.

## Tasks Completed
1. **Filesystem Exploration**: Investigated critical Linux directories and their real-world DevOps use cases.
2. **Permissions Practice**: Intentionally broke and fixed permissions on test files to simulate production access issues.
3. **Provisioning Script**: Wrote `provision.sh`, a parameterized Bash script that automates creating users, assigning them to groups, establishing isolated workspace directories, and locking down access using `chown` and `chmod`.

## Files
- `provision.sh`: The automated provisioning script.
- `test_permissions.txt`: A test file used for safely experimenting with `chmod` and octal values.

## Key Learnings
- **SUID/SGID**: Discovered how improper use of SUID on executables (like text editors) can lead to catastrophic privilege escalation.
- **Octal Permissions**: Learned how to quickly translate required access levels into numeric values (e.g., `770` for full Owner/Group access with no Public access).
- **Bash Scripting**: Understood the importance of the shebang (`#!/bin/bash`), using positional variables (`$1`, `$2`), and the critical sequence of commands (e.g., creating a group *before* adding a user to it).
