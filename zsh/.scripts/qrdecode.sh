#!/usr/bin/env bash
funciton qrdecode() {
    o=$(zbarimg -q $@)
    echo "${o:8}"
}
