---
title: Host Hugo Sites On GITHUB
date: 2022-12-15T23:35:24+11:00
draft: false
tags: [ "git", "github", "Hugo", "Free Hosting"]
categories: ["Tutorials"]
#author: "Ashish"
---
Hugo is free, static, fast and minimal website creator.
In this blog we are going to setup this current Hugo site (without modification) and deploy to Github Pages for free.
I am also going to setup so new posts can be added and published on your website everytime.

1. Login Github
2. Install Hugo On System
3. Create Two Repos on Github

	a. _blog_
		*Houses our hugo code*
	b. username.github.io
		_For website generated pages_

4. Get Theme for Hugo (PaperMod)
5. Clone '_blog_ ' Repo in Desktop (*notesite*) `git clone https://github.com/*/blog.git`
6. Inside blog repo _run Hugo_
	1. */blog/* `hugo new site notes`
	2. */blog/* `cd notes/theme`
	3. */blog/notes/theme/* `git clone https://github.com/adityatelange/hugo-PaperMod.git`
	4.  */blog/notes/theme/* `cd ../`
	5. */notes/*`sudo nano config.toml` - to use toml or change it to yaml. **NOTE**
	6. add `theme: PaperMod` and change baseUrl value

**_Use any converter from [Google](https://www.google.com/search?q=change+toml+to+yaml&oq=change+toml+to+yaml) and save it as config.yaml and delete toml file._**

7. Test Site in local server with */notes/* `hugo server`
8. add a demo post with */notes/*  `hugo new posts/firstPost.md`
9. Edit `Title`, remove `draft` add contents below horizontal line.

## Submodule
1. Go back to */notesite/* `cd ../`
2. */notesite/* `git clone https://github.com/username/username.github.io`
3. */notesite/* `cd username.github.io`
4. create and switch to _main_ branch */username.github.io/* `git checkout -b main`
5. have atleast one commit as readme */username.github.io/* `touch readme.md`
6. */username.github.io/* `git add .`
7. commit to _main_ */username.github.io/* `git commit -m "Adding Readme"`
8. push to main branch */username.github.io/* `git push origin main`

## Add Git Submodule
	References to the repository.
1. */username.github.io/* `cd ../`
2. */notesite/* `cd blog`
3. */blog/* `cd notes`
4. Add static genereated files to */public/* folder:
	 */notes/* `git submodule add -b main https://github.com/username/username.github.io public`
5. Build site using */notes/* `hugo -t PaperMod`
6. All static sites are generated in *public* Folder

### Upload to username.github.io
1. Inside */public/* folder
   */public/* `git add .`
   */public/* `git commit -m "First static upload"`
   */public/* `git push origin main`
2. DEPLOYED

NOTE: Folder Structure
*/notesite/blog/notes/public*
*/notesite/username.github.io/*

# ADDING NEW POST AND PUBLISHING

### Generate Note
*/notes/* `hugo new posts/post.md`
*/notes/* `hugo -t PaperMod`

### Push to Blog Repo
- */notes/* `git add .`
- */notes/* `git commit -m "somemsg"`
- */notes/* `git push origin main`

### Push to Github pages and Publish on Website
- */notes/* `cd public`
- */notes/public/* `git add .`
- */notes/public/* `git commit -m "somemsg"`
- */notes/public/* `git push origin main`



```
NOTE: Folder Structure

/notesite/blog/notes/public/
/notesite/username.github.io/
```
