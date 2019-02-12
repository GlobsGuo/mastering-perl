#!/usr/bin/perl
use v5.16;
use strict;
use diagnostics;
use re 'debug';

if( 'foobar' =~ /(?<!foo)bar/ ) {
	print "Matches! That's not what I wanted!\n";
} else {
	print "Doesn't match! Whew!\n";
}

if( 'foobar' =~ /(?!foo)bar/ ) {
	print "Matches! That's not what I wanted!\n";
} else {
	print "Doesn't match! Whew!\n";
}

if( 'foobarbar' =~ /(?<!foo)bar/ ) {
	print "Matches! That's not what I wanted!\n";
} else {
	print "Doesn't match! Whew!\n";
}

if( 'foobarbar' =~ /(?!foo)bar/ ) {
	print "Matches! That's not what I wanted!\n";
} else {
	print "Doesn't match! Whew!\n";
}

my $money = '$1234.5678';
$money =~ s/(?<=\d)(?=(?:\d\d\d)+$)/,/g;
print '$ boundary: ', $money, "\n";

$money = '$1234.5678';
$money =~ s/(?<=\d)(?=(?:\d\d\d)+\b)/,/g;
print '\b boundary: ', $money, "\n";

$money = '$1234.5678';
$money =~ s/(?<!\.\d)(?<=\d)(?=(?:\d\d\d)+\b)/,/g;
print 'negative and positive lookbehind: ', $money, "\n";
$money = '$1234.5678';
