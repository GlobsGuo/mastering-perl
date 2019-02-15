#!/usr/bin/perl -T
use v5.16;
use strict;
use diagnostics;

use Scalar::Util qw(tainted);

my $tainted = $ARGV[0];
print "$tainted is tainted\n" 
	if tainted($tainted);

my $value = $tainted ? 'Fred' : 'Barney';
print "$value is not tainted\n" 
	unless tainted($value);
