#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use Fatal qw( open );
my $file = "/etc/passwd";
eval {
	open my ( $fh ), ">", $file;
};
if ( $@ ) {
	print "Could not open $file: $@";
}

