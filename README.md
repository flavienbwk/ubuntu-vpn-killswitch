# Ubuntu VPN killswitch

Ubuntu configuration for implementing a killswitch when your VPN connection drops.

## Principle

When connecting to a VPN through the NetworkManager, it can happen your VPN drops connection. If you don't implement a killswitch, your IP will be public for any new query. A killswitch allows blocking any connection to Internet if your VPN connection drops.

Your computer uses a specific `tun0` interface when connecting to a VPN. 

The principle behind the following scripts is simply to deny all connection except the one from `tun0` thanks to `ufw` (a firewall).

## Install

1. **Connect to your VPN** and check the interface used by your computer

    It _should_ be `tun0` but we want to make sure :

    ```bash
    ip a | grep tun0
    ```

    If this commands return nothing, enter the `ip a` command and check which network interface your VPN uses.

2. Installing firewall script

    ```bash
    git clone https://github.com/flavienbwk/ubuntu-vpn-killswitch && cd ubuntu-vpn-killswitch

    sudo apt-get install ufw -y # Installing UFW

    # Copy script files
    cp firewall.sh ~/firewall.sh
    cp unfirewall.sh ~/unfirewall.sh

    # Enable firewall for VPN-connections only
    # CONNECT TO YOUR VPN FIRST
    bash ~/firewall.sh

    # Disable firewall to go back to regular connection
    bash ~/unfirewall.sh
    ```
