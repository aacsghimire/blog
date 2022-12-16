---
title: "Quickly Deploy "
date: 2022-12-16T12:43:19+11:00
draft: false
tags: [ "git", "github", "install", "quick deploy"]
---

Yes there are too many codes to just deploy your post, now to tackle that hassle we will create a code to upload everything with just one line.
In order to go thorough you need to configure your default credentials.
Here is a [Stack Overflow Link](https://stackoverflow.com/questions/35942754/how-can-i-save-username-and-password-in-git) for time being, before i post.
Steps:
1. Outside your blog folder create an empty file.
2. Rename it to _deploy.sh_
3. Now we need to edit the code you can copy the code below make sure yoiu change the name of the directories.
```
#!/bin/bash

cd notes

hugo

git add .

git commit -m "new post"

git push origin main

cd public

git add .

git commit -m "new post"

git push origin main

```
4. Now let's make the file executable
   `chmod u+x deploy.sh`
5.Open the _terminal_ and run
	`./deploy.sh`

If you have set global credentials your new post will be uploaded within 1-2 minutes.
Enjoy!

Note: Get full detail on [Hugo To Github]({{<ref "/hugotogithub">}})
