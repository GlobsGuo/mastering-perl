#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use Data::Dump::Streamer;

my $closure = do {
	my $n = 10;
	sub { return $n++ } 
};
print Dump( $closure );

