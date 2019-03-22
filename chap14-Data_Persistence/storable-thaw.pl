#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use Business::ISBN;
use Data::Dumper;
use Storable qw( nfreeze thaw );

my $isbn = Business::ISBN->new( '0596102062' );
my $frozen = eval { nfreeze( $isbn ) };
if ( $@ ) { warn "Serious error from Storable:$@" }
my $other_isbn = thaw( $frozen );
print "The ISBN is ", $other_isbn->as_string, "\n";

