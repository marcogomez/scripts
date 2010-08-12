#!/bin/bash
 
# Marco Antonio Gomez (AptScience.com): 2010/08/11 20:52
# Criado com: vim  =) (Encoding:UTF-8) 
 
tmux new-session -d -s Terminal 'htop' \; split-window -d 
# tmux new-session -d 'vi /etc/passwd' \; split-window -d \; attach

tmux new-window -t Terminal:1 -n 'Shell1' 'bash'
tmux new-window -t Terminal:2 -n 'Shell2' 'bash'
tmux new-window -t Terminal:3 -n 'Server' 'ssh hal9000'
tmux new-window -t Terminal:4 -n 'Resources' 'htop --sort-key M_RESIDENT'

tmux select-window -t Terminal:1
tmux -2 attach-session -t Terminal

