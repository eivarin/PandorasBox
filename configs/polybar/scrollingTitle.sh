#!/bin/zsh

zscroll --delay 0.2 -l 40 \
		--match-command "xtitle" \
		--update-check true "xtitle" &

wait