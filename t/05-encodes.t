#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More tests => 4;

use HTML::AutoTag;

my $auto = HTML::AutoTag->new();

is $auto->tag( tag => 'foo', cdata => '<bar baz="qux">' ),
    '<foo><bar baz="qux"></foo>',
    "encodes turned off for all unsafe chars";

$auto = HTML::AutoTag->new( encodes => undef );
is $auto->tag( tag => 'foo', cdata => '<bar baz="qux">' ),
    '<foo>&lt;bar baz=&quot;qux&quot;&gt;</foo>',
    "encodes turned on for all default unsafe chars";

$auto = HTML::AutoTag->new( encodes => 0 );
is $auto->tag( tag => 'foo', cdata => '<bar baz="0">' ),
    '<foo><bar baz="&#48;"></foo>',
    "encodes turned on for character 0";

$auto = HTML::AutoTag->new( encodes => '<=' );
is $auto->tag( tag => 'foo', cdata => '<bar baz="qux">' ),
    '<foo>&lt;bar baz&#61;"qux"></foo>',
    "encodes turned on for specific unsafe chars";
