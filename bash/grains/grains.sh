#!/usr/bin/env bash

echo $((2 ** ($1 - 1)))  # This will overflow on $1 = 64

