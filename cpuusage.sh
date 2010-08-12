#!/bin/bash
if [[ $(uname) == "Darwin" ]]; then
	top -n0 -l1 -l3 | grep "CPU usage" | tail -n 1
fi

