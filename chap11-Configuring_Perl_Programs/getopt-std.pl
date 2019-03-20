#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use Getopt::Std;

getopt( 'dog', \my %opts );

print <<"HERE";
The value of 
	d	$opts{d}
	o	$opts{o}
	g	$opts{g}
HERE

