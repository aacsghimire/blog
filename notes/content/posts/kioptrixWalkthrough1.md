---
title: "Vulnhub Kioptrix Walkthrough Part 1"
date: 2022-12-18T23:11:31+11:00
draft: true
tags: [ "Vulnhub", "Kioptrix", "Walkthrough", "TCM-SEC"]
categories: ["Vulnhub Walkthrogh"]
---

```
Default username: John
Default Password: TwoCows2
```
##### Lets find our IP
- Start Virtual Machine
- `ping 8.8.8.8` in your main OS terminal, this will give us ip of our target machine
 ![kioptrixIP](/posts/img/kioptrixwt1_1.png)
 - Now go to your main machine _Kali_ run `sudo arp-scan -l`
![kioptrixIP](/posts/img/kioptrixwt1_2.png)

This will give us *IP address - Mac Address and Vendor*
We are looking for our matching IP. or *Azureware/VMware*

- Now go to terminal
	- `sudo netdiscover -r 192.168.0.0/2`