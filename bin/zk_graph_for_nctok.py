#!/bin/env python
import re
import sys


def scan_file(filename, parents):
    (title, childs) = get_childs(filename)

    # prevent cycles
    if title in parents:
        return
    else:
        parents.append(title)

    for child in childs:
        scan_file(child, parents.copy())

    number = 1
    # number = lines_count(filename)
    print(str(number) + " " + "|".join(parents))


def get_childs(filename):
    f = open(filename, "r")
    lines = f.readlines()
    f.close()
    title = lines.pop(0).rstrip()[2:]
    childs = []
    for line in lines:
        match = re.search(r"\[.*\]\((.{4})\)", line)
        if not match:
            continue

        match = match.group(1) + ".md"
        childs.append(match)

    return (title, childs)


def lines_count(filename):
    return sum(1 for _ in open(filename))


root = sys.argv[1]
scan_file(root, [])
