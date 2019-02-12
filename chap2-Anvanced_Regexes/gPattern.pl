#!/usr/bin/perl
use v5.16;
use strict;
use diagnostics;

$_ = "Just another Perl hacker.";
my @arr = /(\S+)/g;
print "The next position is @{ [ pos( $_ ) ] }\n";

