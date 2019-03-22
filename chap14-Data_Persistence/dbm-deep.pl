#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use DBM::Deep;

my $isbn = DBM::Deep->new( 
	file	=>	"isbn.db",
	locking	=>	1,
	autoflush	=>	1,
);
if ( $@ ) {
	warn "Could not create database: $@\n";
}
$isbn->{'0596102062'} = 'Intermediate Perl';

my $value = $isbn->get( '0596102062' );
print "$value\n";
