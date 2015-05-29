use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'HTML::AutoTag',
    AUTHOR           => q{Jeff Anderson <jeffa@cpan.org>},
    VERSION_FROM     => 'lib/HTML/AutoTag.pm',
    ABSTRACT_FROM    => 'lib/HTML/AutoTag.pm',
    LICENSE          => 'Artistic_2_0',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        'Tie::Hash::Attribute' => 0.04,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'HTML-AutoTag-*' },
);
