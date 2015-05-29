HTML::AutoTag
=============
Turn data into HTML.

Synopsis
--------
```perl
use HTML::AutoTag;

print HTML::AutoTag->new( site => 'facebook.com' );
    # renders a Facebook site

print HTML::AutoTag->new( site => 'google.com' );
    # renders a Google search engine

print HTML::AutoTag->new( site => 'gold' );
    # makes gold bars that pop out of your screen

```

Installation
------------
To install this module, you should use CPAN. A good starting
place is [How to install CPAN modules](http://www.cpan.org/modules/INSTALL.html).

If you truly want to install from this github repo, then
be sure and create the manifest before you test and install:
```
perl Makefile.PL
make
make manifest
make test
make install
```

Support and Documentation
-------------------------
After installing, you can find documentation for this module with the
perldoc command.
```
perldoc HTML::AutoTag
```
You can also find documentation at [metaCPAN](https://metacpan.org/pod/HTML::AutoTag).

License and Copyright
---------------------
See [source POD](/lib/HTML/AutoTag.pm).
