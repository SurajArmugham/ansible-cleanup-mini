# Ansible Cleanup Automation -- CI/CD Demo (macOS)

This project demonstrates end-to-end DevOps automation using:

-   Bash scripting
-   Ansible roles & playbooks
-   GitHub Actions (CI + CD)
-   Self-hosted runner (macOS)

It simulates how companies deploy automation from a central pipeline to
target machines.

------------------------------------------------------------------------

# 🚀 What This Project Does

This project:

-   Deletes files older than **N days** from a directory
-   Uses **Bash** for system-level logic
-   Uses **Ansible** to deploy & execute automation
-   Uses **GitHub Actions** for CI/CD
-   Uses a **self-hosted runner** (your Mac) to execute real automation

------------------------------------------------------------------------

# 🧠 Architecture Overview

## CI (Cloud)

    GitHub Push
       ↓
    GitHub Actions Runner (Cloud VM)
       ↓
    Syntax validation of Ansible playbooks

## CD (Local Execution)

    GitHub Workflow Trigger
       ↓
    Self-Hosted Runner (Your Mac)
       ↓
    Ansible Playbook
       ↓
    Bash Script
       ↓
    Cleanup executed locally

This simulates real enterprise deployment pipelines.

------------------------------------------------------------------------

# 📁 Project Structure

    ansible-cleanup-mini/
    │
    ├── .github/workflows/
    │   ├── ansible-ci.yml        # CI pipeline (syntax validation)
    │   └── run-cleanup.yml       # CD pipeline (runs on self-hosted Mac)
    │
    ├── ansible/
    │   ├── ansible.cfg           # Ansible configuration
    │   │                          # Defines roles_path, inventory, defaults
    │   │
    │   ├── inventory/
    │   │   └── hosts.ini         # Target machine list (localhost for demo)
    │   │
    │   ├── playbooks/
    │   │   ├── ping.yml          # Test playbook
    │   │   └── cleanup.yml       # Main execution playbook
    │   │
    │   └── roles/
    │       └── cleanup/
    │           ├── files/
    │           │   └── cleanup.sh   # Script copied to target
    │           │
    │           └── tasks/
    │               └── main.yml     # Deploy + execute logic
    │
    ├── scripts/
    │   └── cleanup.sh             # Development copy of bash script
    │
    ├── target_dir/                # Test directory (gitignored)
    │
    ├── .gitignore
    └── README.md

------------------------------------------------------------------------

# ⚙️ How It Works

## Step 1 --- Bash Script

Handles the actual cleanup:

-   Finds files older than N days
-   Deletes them safely
-   Accepts directory as parameter

------------------------------------------------------------------------

## Step 2 --- Ansible Role

Responsible for:

-   Copying script to:

        /tmp/cleanup.sh

-   Setting execute permission

-   Running the script on the target

------------------------------------------------------------------------

## Step 3 --- Inventory

    localhost ansible_connection=local

Defines the target machine.

In real companies this would be:

-   Multiple Linux servers
-   Cloud VMs
-   Kubernetes nodes

------------------------------------------------------------------------

## Step 4 --- CI Workflow (ansible-ci.yml)

Runs on GitHub cloud runner:

-   Installs Ansible
-   Validates playbook syntax
-   Prevents broken deployments

This does NOT run cleanup.

------------------------------------------------------------------------

## Step 5 --- CD Workflow (run-cleanup.yml)

Runs on self-hosted runner:

-   Triggered manually or by push
-   Executes Ansible locally
-   Performs real cleanup

------------------------------------------------------------------------

# 🖥️ Self-Hosted Runner

A self-hosted runner means:

> GitHub sends the job to YOUR machine.

So instead of:

    GitHub → Cloud VM → Run script

We get:

    GitHub → Your Mac → Run script

This simulates:

-   Jenkins agents
-   Deployment servers
-   Automation jump boxes

Used heavily in enterprise environments.

------------------------------------------------------------------------

# ▶️ How to Run Locally (Manual)

    cd ansible
    ansible-playbook -i inventory/hosts.ini playbooks/cleanup.yml

------------------------------------------------------------------------

# ▶️ How to Run via GitHub Actions

Go to:

    GitHub → Actions → Run Cleanup on Mac → Run workflow

This will:

-   Send job to your Mac
-   Execute cleanup via Ansible

------------------------------------------------------------------------

# 🔐 Safety Notes

-   Cleanup script runs ONLY on configured targets
-   CD workflow can be set to manual trigger only
-   Runner can be stopped anytime with CTRL+C

------------------------------------------------------------------------

# 🏢 Real-World Mapping

  This Project     Real Company Equivalent
  ---------------- -------------------------
  Mac              Deployment server
  localhost        Target VMs
  GitHub Actions   Jenkins / CI
  Ansible          Config management
  Bash             System automation

------------------------------------------------------------------------

# 🧑‍💻 Skills Demonstrated

-   Ansible roles & playbooks
-   CI/CD pipeline design
-   Self-hosted runner setup
-   Infrastructure automation thinking
-   Bash system scripting

------------------------------------------------------------------------

# 📌 Future Improvements

-   Deploy to multiple VMs
-   Add dry-run mode
-   Add logging
-   Use SSH-based remote inventory
-   Add Jenkins pipeline version
