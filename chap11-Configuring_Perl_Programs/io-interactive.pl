#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use IO::Interactive qw( is_interactive interactive );
my $can_talk = is_interactive();
print "Hello World!\n" if $can_talk;
print { interactive() } "Hello World!\n";

