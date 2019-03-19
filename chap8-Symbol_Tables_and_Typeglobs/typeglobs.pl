#!/usr/bin/perl
use v5.16;
use strict;
use diagnostics;

my $foo = "Some value";
my $bar = "Another value";

who_am_i( *foo );
who_am_i( *bar );

sub who_am_i {
	my $glob = shift;
	print "I'm from package ".*{$glob}{PACKAGE}."\n";
	print "My name is ".*{$glob}{NAME}."\n";
}

