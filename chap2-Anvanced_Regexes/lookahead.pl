#!/usr/bin/perl
use v5.16;
use strict;
use diagnostics;

my @words = split /(?=[A-Z])/, 'CamelCaseString';
print join '_', map { lc } @words;
print "\n";

@words = split /[A-Z]/, 'CamelCaseString';
print join '_', map { lc } @words;
print "\n";

