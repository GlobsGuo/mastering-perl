#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use Business::ISBN;
use YAML qw( Dump );

my %hash = qw( 
	Fred	Flintstone
	Barney	Rubble
);

my @array = qw( Fred Barney Betty Wilma );
my $isbn = Business::ISBN->new( '0596102062' );
open my ( $fh ), ">", 'dump.yml' or die "Could not write to file:$!\n";
print $fh Dump( \%hash, \@array, $isbn );

