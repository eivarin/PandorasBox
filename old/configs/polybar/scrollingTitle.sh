#!/bin/zsh

zscroll --delay 0.2 -l 60 \
		--match-command "xtitle" \
		--update-check true "xtitle" &

wait