#!/usr/bin/perl
use v5.16;
use strict;
use diagnostics;

$_ = "foo.bar";
s.\...;
print "$_\n";

