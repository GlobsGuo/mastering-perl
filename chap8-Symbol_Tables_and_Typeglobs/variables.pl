#!/usr/bin/perl
use v5.16;
#use strict;
use diagnostics;

our $global = "I'm the global version";

show_me( 'At start' );
lexical();
localized();
show_me( 'At end' );

sub show_me {
	my $tag = shift;
	print "$tag: $global\n";
}

sub lexical {
	my $global = "I'm in the lexical verion";
	{
		our $global;
		print "In lexical() with our, \$global is --> $global\n";
	}
	print "In lexical(), \$global is --> $global\n";
	print "The package version is still --> $main::global\n";
	show_me( 'From lexical()' );
}

sub localized {
	local $global = "I'm in the localized version";
	print "In localized(), \$global is --> $global\n";
	show_me( 'From localized' );
}
