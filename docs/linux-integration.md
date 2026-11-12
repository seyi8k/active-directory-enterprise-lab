# Linux Server Integration

## Overview

Integrated an Ubuntu Server into the existing Windows Active Directory environment to demonstrate centralized authentication across Windows and Linux systems.

## Configuration

| Setting | Value |
|---|---|
| Hostname | LINUX01 |
| Operating System | Ubuntu Server |
| Hypervisor | Hyper-V |
| Network | 10.10.10.0/24 |
| Domain | corp.adlab.test |
| DNS Server | 10.10.10.10 |

## Implementation

1. Deployed Ubuntu Server on Hyper-V using the `ADLab-Switch` internal network.
2. Configured networking to use DC01 for DNS resolution.
3. Installed `realmd`, `SSSD`, and `adcli` for Active Directory integration.
4. Joined LINUX01 to the `corp.adlab.test` domain.
5. Configured domain user authentication.

## Validation

![Verified domain membership](../screenshots/linux/domain-join.png)

![Verified that Ubuntu could resolve an Active Directory user](../screenshots/linux/ad-user-authentication.png)

<table>
  <tr>
    <td width="50%"><img src="../screenshots/linux/ssh-login.png" alt="a successful login from an authorized user"></td>
    <td width="50%"><img src="../screenshots/linux/ssh-login-failure.png" alt="a failed ssh attempt from an unauthorized user"></td>
  </tr>
  <tr>
    <td align="center"><b>Authorized:</b> A member of the linux SSH security group is able to login to LNX01</td>
    <td align="center"><b>Denied:</b> Another user with no security group membership trying to SSH into LNX01 is denied</td>
  </tr>
</table>

Confirmed that Active Directory accounts could be recognized and authenticated on Ubuntu.