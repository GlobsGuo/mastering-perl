#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use Business::ISBN;
use YAML;
my $data = do {
	if ( open my $fh, '<', 'dump.yml' ) { local $/; <$fh> }
	else { undef }
};

my ( $hash, $array, $isbn ) = Load( $data );
print "The ISBN is ", $isbn->as_string, "\n";

