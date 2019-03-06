#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use DBI;

my $dbh = DBI->connect( "DBI:CSV:f_dir=." );
$dbh->do( "DROP TABLE names" );
$dbh->do( "CREATE TABLE names ( id INTEGER, name CHAR(64) )" );

my $sth = $dbh->prepare( "INSERT INTO names VALUES ( ?, ? )" );

my $id = 1;
foreach my $name (
	qw( One Tow Three Four Five Six Seven Eight Nine Ten ),
	qw( Eleven Twelve Thirteen Fourteen Fifteen Sixteen ),
	qw( Seventeen Eighteen Nineteen ) ) {
	$sth->execute( $id++, "$name" );
}

foreach my $name (
	qw( Twenty Thirty Forty Fifty Sixty Seventy Eighty Ninety ) ) {
	$sth->execute( $id++, $name );
	foreach my $ones_digit ( 1 .. 9 ) {
		my ( $ones_name ) = map { lc } $dbh->selectrow_array(
			"SELECT name FROM names WHERE id = $ones_digit" );
		$sth->execute( $id++, "$name $ones_name" );
	}
}

foreach my $digit ( 1 .. 9 ) {
	my ( $hundreds ) = $dbh->selectrow_array(
		"SELECT name FROM names WHERE id = $digit" );
	$sth->execute( $id++, "$hundreds hundred" );
	foreach my $tens_digit ( 1 .. 99 ) {
		my ( $tens_name ) = map { lc } $dbh->selectrow_array(
			"SELECT name FROM names WHERE id = $tens_digit" );
		$sth->execute( $id++, "$hundreds hundred $tens_name" );
	}
}


