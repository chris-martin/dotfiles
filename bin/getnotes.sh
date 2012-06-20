#!/bin/bash
#http://ubuntuforums.org/showthread.php?t=623808

echo
echo "TODOs"
echo "-----"
for file in $(grep -Ril "TODO" * | sort -u); do
    echo
    echo "  ${file}"
    grep -i --color=auto "TODO" ${file} | while read line; do
        echo -n "    "
        echo ${line} | sed "s/^.*TODO//"
    done
done
echo
echo "FIXMEs"
echo "------"
for file in $(grep -Ril "FIXME" * | sort -u); do
    echo
    echo "  ${file}"
    grep -i --color=auto "FIXME" ${file} | while read line; do
        echo -n "    "
        echo ${line} | sed "s/^.*FIXME//"
    done
done
echo

