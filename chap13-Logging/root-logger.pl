#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use Log::Log4perl;
Log::Log4perl::init( 'root-logger.conf' );
my $logger = Log::Log4perl->get_logger;
$logger->error( "I've got something to say!" );
$logger->fatal( "I'm very important!" );

$logger->debug( "I'm not concerned!" );
