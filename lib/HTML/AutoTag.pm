package HTML::AutoTag;
use 5.006;
use Carp;
use strict;
use warnings FATAL => 'all';

our $VERSION = '0.01';


1;

__END__
=head1 NAME

HTML::AutoTag - Turn data into HTML.

=head1 SYNOPSIS

  use HTML::AutoTag;

  print HTML::AutoTag->new( site => 'facebook.com' );
    # renders a Facebook site

  print HTML::AutoTag->new( site => 'google.com' );
    # renders a Google search engine

  print HTML::AutoTag->new( site => 'gold' );
    # makes gold bars that pop out of your screen


=head1 DESCRIPTION

This module will make some HTML, yo.

=head1 BUGS AND LIMITATIONS

Please report any bugs or feature requests to either

=over 4

=item * Email: C<bug-html-autotag at rt.cpan.org>

=item * Web: L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=HTML-AutoTag>

=back

=head1 GITHUB

The Github project is L<https://github.com/jeffa/HTML-AutoTag>

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc HTML::AutoTag

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here) L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=HTML-AutoTag>

=item * AnnoCPAN: Annotated CPAN documentation L<http://annocpan.org/dist/HTML-AutoTag>

=item * CPAN Ratings L<http://cpanratings.perl.org/d/HTML-AutoTag>

=item * Search CPAN L<http://search.cpan.org/dist/HTML-AutoTag/>

=back

=head1 SEE ALSO

=over 4

=item * L<http://www.w3.org/TR/html5/syntax.html>

=back

=head1 AUTHOR

Jeff Anderson, C<< <jeffa at cpan.org> >>

=head1 LICENSE AND COPYRIGHT

Copyright 2015 Jeff Anderson.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
=cut
