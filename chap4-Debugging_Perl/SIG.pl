#!/usr/bin/perl
use v5.16;
use strict;
use diagnostics;

use Carp;
print "
$SIG{__DIE__} = sub { &Carp::croak };
die "I'm going now";

