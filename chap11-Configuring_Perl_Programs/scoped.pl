#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use Config::Scoped;
my $config = Config::Scoped->new( file	=> 'config-scoped.txt' )->parse;
die "could not read config!\n" unless ref $config;
print "The author is ", $config->{book}{author}{name}, "\n";

