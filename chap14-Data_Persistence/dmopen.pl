#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

dbmopen %HAHS, "dbm-open", 0644;

$HASH{'0596102062'} = 'Intermediate Perl';
while ( my ( $key, $value ) = each %HASH ) {
	print "$key: $value\n";
}
dbmclose %HASH;

