#!/bin/bash
hexo cl
hexo g
hexo d
git add .
git commit -m "提交代码"
git push
