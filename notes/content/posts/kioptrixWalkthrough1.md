---
title: "Vulnhub Kioptrix Walkthrough Part 1"
date: 2022-12-18T23:11:31+11:00
draft: false
tags: [ "Vulnhub", "Kioptrix", "Walkthrough", "TCM-SEC", "NMAP", "netdiscover", "ARP-SCAN"]
categories: ["Vulnhub Walkthrogh"]
---

```
Default username: John
Default Password: TwoCows2
```
*_Tips: Save your all Scans in text/image for future use_*

### Lets find our IP
- Start Virtual Machine
- `ping 8.8.8.8` in your main OS terminal, this will give us ip of our target machine
 ![kioptrixIP](/posts/img/kioptrixwt1_1.png)
 - Now go to your main machine _Kali_ run `sudo arp-scan -l`
![kioptrixIP](/posts/img/kioptrixwt1_2.png)

This will give us *IP address - Mac Address and Vendor*
We are looking for our matching IP. or *Azureware/VMware*

*** 
*_Optional_*

Now go to terminal
	- `sudo netdiscover -r your IP/subnet mask`
		- `sudo netdiscover -r 192.168.0.0/24`
*_This did not work in my case_*
***
### Look for OPEN PORTS
	nmap
- `sudo nmap -sS 192.168.0.26` *-sS stands for stealth mode*
  ![kioptrixIP](/posts/img/kioptrixwt1_3.png)

### For Full scan with *nmap*:
	Gives extensive information
- `sudo nmap -T4 -p- -A ip_of_target` 
	
	*_Note: Here -T4 is for speed, -p- all Ports and  -A for all info, OS, Fingerprinting, applications and their version of applications, etc._*
![kioptrixIP nmap ip](/posts/img/kioptrixwt1_4.png)

### NMAP
	Common Nmap commands and Uses

- Host Discovery
	- As long as there is `nmap . . .  ip`  it is going to discover hosts
	- attribute order does not matter start with `nmap` or `sudo nmap` and end with `ip`
	- To scan only UDP
		- `nmap -sU -T4 192.168.0.26`
			- Note: removing -A makes it faster because it only scan few Info
![kioptrix NMAP udp scan](/posts/img/kioptrixwt1_5.png)	
---
Here we found:
- Target IP, Mac Address
- OPEN TCP Ports
- OS, application uses, and Versions
- Some more useful info.