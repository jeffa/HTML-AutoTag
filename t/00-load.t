#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More tests => 10;

use_ok 'HTML::AutoTag';

my $new = new_ok 'HTML::AutoTag', [ encodes => '<>', indent => '   ' ];

is $new->{encodes}, '<>',          "encodes correctly set";
is $new->{indent}, '   ',          "indent correctly set";

my $auto = HTML::AutoTag->new;

is $auto->tag( 'foo' ), '<foo />',                      "tag with no attributes or children: list";
is $auto->tag( 'foo', 'bar' ), '<foo>bar</foo>',        "tag with children: list";


is $auto->tag( 'foo', { class => 'baz' } ), '<foo class="baz" />',          "tag with only attributes: list";

is $auto->tag( 'foo', { class => 'baz' }, 'bar' ), '<foo class="baz">bar</foo>',        "tag with attributes and children: list";
