#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use Log::Log4perl qw( :easy );

Log::Log4perl->easy_init(
	{
		file	=>	"error.log",
		level	=>	$ERROR,
	},
	{
		file	=>	"info.log",
		level	=>	$INFO,
	},
	{
		file	=>	"warn.log",
		level	=> 	$WARN,
	},
	{
		file 	=>	"debug.log",
		level	=>	$DEBUG,
	},
);

DEBUG( "DEBUG" );
WARN( "WARN" );
INFO( "INFO" );
ERROR( "ERROR" );
