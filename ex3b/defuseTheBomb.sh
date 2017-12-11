#!/bin/bash
pid=$1
# Use nsenter to defuse the bomb
# Enter the UTS namespace of ${pid} and change its hostname
