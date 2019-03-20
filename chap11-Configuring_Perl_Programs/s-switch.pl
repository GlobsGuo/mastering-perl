#!/usr/bin/perl -s
use v5.16;
use strict;
use warnings;
use diagnostics;

use vars qw ( $a $abc );
print "The value of the -a switch is [$a]\n";
print "The value of the -abc switch is [$abc]\n";

{
	no strict 'refs';
	print "The value of the switch --debug is [${'-debug'}]\n";
}
