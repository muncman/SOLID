#!/bin/sh
# echo $? to see the result value (0 or 1)
ping -c 1 -t 30 -o munc.com
# NOTE: More specific tests could be achived with curl or similar, but still stay low-tech.
