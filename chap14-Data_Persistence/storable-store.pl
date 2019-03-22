#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use Business::ISBN;
use Storable qw( store );

my $isbn = Business::ISBN->new( '0596102062' );
my $result = eval { store( $isbn, 'isbn-stored.dat' ) };

if ( $@ ) {
	warn "Serious error from Storable: $@";
} elsif (not defined $result) {
	warn "I/O error from Storable: $!";
}

