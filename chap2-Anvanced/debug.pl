#!/usr/bin/perl
use v5.16;
use strict;
use diagnostics;
#use re 'debug';

use YAPE::Regex::Explain;
print YAPE::Regex::Explain->new( $ARGV[0] )->explain;
#ARGV[0] =~ /$ARGV[1]/;

