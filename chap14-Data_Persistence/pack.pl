#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

my $packed = pack ( 'NCA*', 31415926, 32, 'Perl' );
print 'Packed string has length['.length ( $packed )."]\n";
print "Packed string is [$packed]\n";

my ( $long, $char, $ascii ) = unpack ( 'NCA*', $packed );
print <<"HERE";
long: $long
char: $char
ascii: $ascii
HERE

my ( $isbn, $title, $author ) = (
	'0596527241', 'Mastering Perl', 'brian d foy'
);
my $record = pack ( "A10 A20 A20", $isbn, $title, $author );
print "Record: [$record]\n";
