#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use Data::Dumper;

my $file = "data-dumper.txt";
print "Before do, \$INC{$file} is [$INC{$file}]\n";
{
	no strict 'vars';
	do "./$file";
	print "After do, \$INC{$file} is [$INC{$file}]\n";
	print "Fred's last name is $dumpedhash{Fred}\n";
}

