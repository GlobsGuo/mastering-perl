#!/usr/bin/perl -T
use v5.16;
use strict;
use diagnostics;

use Scalar::Util qw(tainted);

print "The first argument is tainted\n"
	if tainted( $ARGV[0] );

@ARGV = keys %{ { map { $_, 1 } @ARGV } };
print "The first argument isn't tainted anymore\n"
	unless tainted( $ARGV[0] );


