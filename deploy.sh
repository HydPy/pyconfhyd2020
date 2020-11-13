#!/bin/sh

setup_git() {
  git config --global user.email "github-actions@hydpy.org"
  git config --global user.name "Github Actions"
}

commit_changes() {
  git clone https://github.com/HydPy/hydpy.github.io.git pyconf-websites
  cd pyconf-websites
  rm -rf 2020
  mkdir 2020
  cp -rf ../_site/* 2020/
  git add .
  git commit -m "Githb Actions Build: pyconfhyd2020-${GITHUB_RUN_ID}"
}

push_files_to_github() {
  git remote add origin-pages https://${GH_TOKEN}@github.com/HydPy/hydpy.github.io.git
  git push origin-pages master
}

setup_git
commit_changes
push_files_to_github
