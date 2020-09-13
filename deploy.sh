#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_changes() {
  git clone https://github.com/HydPy/hydpy.github.io.git pyconf-websites
  cd pyconf-websites
  rm -rf 2020
  mkdir 2020
  cp -rf ../_site/* 2020/
  git add .
  git commit -m "Travis build: pyconfhyd2020-$TRAVIS_BUILD_NUMBER"
}

push_files_to_github() {
  git remote add origin-pages https://${GH_TOKEN}@github.com/HydPy/hydpy.github.io.git
  git push origin-pages main
}

setup_git
commit_changes
push_files_to_github