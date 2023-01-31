#!/bin/bash
exiftool -all:all= -r notes/content/posts/img/ -overwrite original
cd notes
hugo
git add .
git commit -m "new post"
git push origin main --force
