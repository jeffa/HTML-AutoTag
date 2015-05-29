#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'HTML::AutoTag' ) || print "Bail out!\n";
}

diag( "Testing HTML::AutoTag $HTML::AutoTag::VERSION, Perl $], $^X" );
