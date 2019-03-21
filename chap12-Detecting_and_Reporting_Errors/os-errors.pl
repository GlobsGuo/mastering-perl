#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

for ( $! = 0; $! <= 102; $! ++ ) {
	printf ( "%d: %s\n", $!, $! );
}

use Errno qw( ENOENT );
print "ENOENT has the number ". ENOENT ."\n";
