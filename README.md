# Active Directory Homelab

A Windows enterprise homelab built with Hyper-V, Windows Server 2025, Windows 11 Enterprise, Active Directory Domain Services, DNS, DHCP, Group Policy, file services, and PowerShell.

The goal of this project is to build hands-on experience with Windows administration, networking, identity management, automation, and troubleshooting.

## Lab Overview

| System | Role |
|---|---|
| DC01 | Active Directory Domain Services, DNS |
| SRV01 | DHCP, File Services |
| CLIENT01 | Windows 11 domain workstation |
| Windows 11 Host | Hyper-V and NAT |

**Domain:** `corp.adlab.test`  
**Lab Network:** `10.10.10.0/24`

For the full network and Active Directory design, see [Architecture](./docs/01-architecture.md).

## Features

- Active Directory Domain Services
- Active Directory-integrated DNS
- DHCP
- Organizational Unit (OU)
- Domain users and groups
- Windows domain joins
- Group Policy
- File and NTFS permissions
- PowerShell automation
- Hyper-V networking and NAT
- Troubleshooting documentation

## PowerShell Automation

PowerShell scripts are used to automate common administration tasks.

User provisioning is performed from fictional CSV data stored in:

```text
data/users.csv
```

Planned improvements include duplicate checks, logging, validation, group assignment, and error handling.

## Documentation

Detailed documentation is available in the [`docs`](./docs/) directory:

- [Architecture](./docs/01-architecture.md)
- [Hyper-V Networking](./docs/02-hyperv-networking.md)
- [Domain Controller](./docs/03-domain-controller.md)
- [Active Directory](./docs/04-active-directory.md)
- [Client Domain Join](./docs/05-client-join.md)
- [Group Policy](./docs/06-group-policy.md)
- [DHCP and DNS](./docs/07-dhcp-dns.md)
- [File Services](./docs/08-file-services.md)
- [Security](./docs/09-security.md)
- [Troubleshooting](./docs/10-troubleshooting.md)

## Troubleshooting

Problems encountered during the build are documented using:

```text
Issue
Symptoms
Investigation
Root Cause
Resolution
Validation
Lesson Learned
```

See [Troubleshooting](./docs/10-troubleshooting.md) for full write-ups.

## Skills Demonstrated

- Windows Server administration
- Active Directory
- DNS and DHCP
- Group Policy
- Hyper-V
- PowerShell
- IPv4 networking
- Identity and access management
- Windows troubleshooting

## Project Status

### Completed
- Hyper-V internal network
- NAT connectivity
- DC01 deployment
- Active Directory forest
- DNS
- OU structure
- User creation
- PowerShell provisioning
- CLIENT01 domain join
- SRV01 deployment
- DHCP role and AD authorization
- DHCP client configuration
- Group Policy

### In Progress
- File services
- Security groups

### Planned
- Permissions
- Second Domain Controller
- AD replication testing
- Ubuntu Server integration