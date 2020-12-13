#!/usr/bin/python

"""
Calculates chance of two or more people sharing their birthday for a group of 0-100
people. Assumes flat distribution of birthdays throughout the year.
"""

def chance(n):
    x = 1.
    substract = 1.
    for i in range(n):
        substract *= ((1461-i*4)/1461.)
    return x - substract

for i in range(100):
    print ("%d %f" % (i, chance(i)))
