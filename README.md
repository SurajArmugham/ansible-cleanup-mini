# Ansible Cleanup Mini Project

This project demonstrates basic DevOps automation using **Bash** and **Ansible** on a local macOS system.

## What this project does
- Deletes files older than N days from a target directory
- Uses a Bash script for cleanup logic
- Uses Ansible to deploy and execute the script
- Targets `localhost` (your Mac) for learning purposes

## Project structure
ansible-cleanup-mini/
├── scripts/                      # Bash script (development copy)
│   └── cleanup.sh
├── ansible/
│   ├── ansible.cfg               # Ansible config (roles path, defaults)
│   ├── inventory/                # Inventory (localhost)
│   │   └── hosts.ini
│   ├── playbooks/                # Ansible playbooks
│   │   ├── ping.yml
│   │   └── cleanup.yml
│   └── roles/
│       └── cleanup/              # Cleanup role
│           ├── files/
│           │   └── cleanup.sh    # Script deployed by Ansible
│           └── tasks/
│               └── main.yml      # Copy + execute tasks
└── target_dir/                   # Test directory (gitignored)

## How to run locally
1. Go to the ansible directory:
   cd ansible

2. Run the playbook:
   ansible-playbook -i inventory/hosts.ini playbooks/cleanup.yml

## Tools used
- Bash
- Ansible
- Git
- GitHub

## Notes
- The cleanup script is copied to `/tmp/cleanup.sh` on the target system
- `ansible.cfg` helps Ansible find inventory/roles more easily and keeps commands shorter
- This project is for learning and demonstration purposes
