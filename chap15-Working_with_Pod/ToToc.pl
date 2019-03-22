#!/usr/bin/perl
package Pod::Perldoc::ToToc;
use v5.16;
use strict;
use warnings;
use diagnostics;

use base qw( Pod::Perldoc::BaseTo );
use subs qw();
use vars qw();
use Pod::TOC;
$VERSION = '0.10_01';
sub is_pageable 	{ 1 }
sub write_with_binmode 	{ 0 }
sub output_extension 	{ 'toc' }

sub parse_from_file {
	my ( $self, $file, $output_fh ) = @_;
	my $parser = Pod::TOC->new();
	$parser->output_fh( $output_fh );
	$parser->parse_file( $file );
}

