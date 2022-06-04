#!/bin/bash
hexo cl
hexo g
hexo d
git add .
git commit -m "1"
git push
