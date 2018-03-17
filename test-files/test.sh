#!/bin/sh
set -exu
sesh < inp.htx > inp.tex
lualatex inp.tex
