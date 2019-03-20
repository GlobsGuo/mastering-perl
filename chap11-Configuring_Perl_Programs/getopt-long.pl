#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use Getopt::Long;

my $result = GetOptions(
	'debug|d'	=>	\my $debug,
	'verbose|v'	=>	\my $verbose,
	"line=i"	=>	\my $line,
	"file=s@"	=> 	\my @file,
);

print <<"HERE";
The value of
	debug	$debug
	verbose	$verbose
	line	$line
	file	@file
HERE

