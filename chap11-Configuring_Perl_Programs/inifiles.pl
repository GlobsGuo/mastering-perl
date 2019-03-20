#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use Config::IniFiles;
my $file = "mastering_perl.ini";
my $ini = Config::IniFiles->new(
	-file	=>	$file
) or die "Could not open $file!";

my $email = $ini->val( 'Network', 'email' );
my $author = $ini->val( 'Book', 'author' );

print "Kindly send complaints to $author ($email)\n";
