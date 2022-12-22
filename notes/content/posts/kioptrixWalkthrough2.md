
---
title: "Vulnhub Kioptrix Walkthrough Part 2"
date: 2022-12-22T22:51:08+11:00
draft: false
tags: [ "Vulnhub", "Kioptrix", "Walkthrough", "TCM-SEC", "nikto", "dirbuster", "Burpsuite"]
categories: ["Vulnhub Walkthrogh"]
---

```
Default username: John
Default Password: TwoCows2
```
### NIKTO
	`Web Vulneribility Scanner`
- `nikto -h target ip*`
	- i.e nikto -host url
![niktoScan](/posts/img/kioptrixwt2_1.png)
- *Findings*
	1. Outdated Applications - Google common exploits for given Version
		1) Apache
		2) mod_ssl
		3) openssl
	2) mod_ssl 
		1) vulnerable to a remote buffer overflow
	3) Little bit of Directory Busting

### DIRBUSTER
	Directory Busting / Finding Folders
	ALternatives: gobuster, dirb, ferox boster

- `dirbuster&`
- insert target url on Target URL section
- Check 'Go Faster'
- Check List based brute force
- Click browse, navigate to `/usr/share/wordlists/dirbuster/`
- Select a list
- File extension: php,txt,zip _choose the extension you want to look for_ 
_*Note: more extension more time*_
- START
![niktoScan](/posts/img/kioptrixwt2_2.png)

*_Tip: Dir Scan takes a while. It is always a good idea to start the scan as soon as possible so we can do other task while the scan is running in Background._*

![Burpsuite Config](/posts/img/kioptrixwt2_3.png)

### BURPSUITE
	Security Testing Web Applications

- start Burpsuite
- Setup your browser for burpsuite from [here](https://notes.ashishghimire.com/posts/reconaissancepart2/)
- Next, Use Burp default
- Start Burp
- Choose _Proxy_ from Top Menu
- Click on *Intercept is off* to tun it on and Open Browser
![Burpsuite Config](/posts/img/kioptrixwt2_4.png)

- Open _target url_ on the browser
- on the text area _right click_ > _send to repeater_
- go to New option _repeater_ on top menu
- try changing command and send
- This can modify website
![Burpsuite Config](/posts/img/kioptrixwt2_5.png)

- Screenshot or save result for info Disclosure
- Go to _Target > Sitemap > Response_ 
- Screenshot for Info Disclosure
- Turn _Intercept_ Off
![Burpsuite Config](/posts/img/kioptrixwt2_6.png)


### Dirbuster (again)
	Results are back

- Lets check folders
- _Usage_ seems interesting
- Lets check files in browser
- At the bottom there is *Webalizer 2.01* 
- Lets note that
*_Note: Check through files and sources for possible Passwords and Leaks_*
