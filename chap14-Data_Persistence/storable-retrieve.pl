#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use Business::ISBN;
use Storable qw( retrieve );

my $isbn = eval { retrieve( 'isbn-stored.dat' ) };
if ( $@ ) {
	warn "Serious error from Storable: $@";
} elsif ( not defined $isbn ) {
	warn "I/O error from Storable: $!";
} elsif ( not eval { $isbn->isa( 'Business::ISBN' ) } ) {
	warn "Didn't get back Business::ISBN object\n";
}
print 'I loaded the ISBN '.$isbn->as_string, "\n";

