#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use ConfigReader::Simple;
my $config = ConfigReader::Simple->new(
	"configreader-simple.txt"
);
die "Could not read config! $ConfigReader::Simple::ERROR\n"
	unless ref $config;

print "The line number is ", $config->get( "line" ), "\n";

