---
title: "Quickly Deploy "
date: 2022-12-16T12:43:19+11:00
draft: false
tags: [ "git", "github", "install", "quick deploy"]
---
#!/bin/bash

cd notesite/blog/notes

hugo

git add .

git commit -m "new post"

git push origin main

_username

_api key_

cd public

git commit -m "new post"

git push origin main

_username_

_api key_