#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use AppConfig;

my $config = AppConfig->new;
$config->define( 'network_email=s' );
$config->define( 'book_author=s' );
$config->define( 'book_title=s' );
$config->define( 'book_publisher=s' );
$config->file( 'mastering_perl.ini' );
$config->args();
my $email = $config->get( 'network_email' );
my $author = $config->get( 'book_author' );

print "Kindly send compalints to $author ($email)\n";
