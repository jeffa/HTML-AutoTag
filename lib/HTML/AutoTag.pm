package HTML::AutoTag;
use 5.006;
use strict;
use warnings FATAL => 'all';
our $VERSION = '0.02';

use Tie::Hash::Attribute;
use Data::Dumper;

sub new {
    my $self = shift;
    my $class = {@_};
    $class->{indent} = ''       unless $class->{indent};
    $class->{encodes} = undef   unless exists $class->{encodes};
    $class->{curr_level} = 0;
    bless $class, $self;
}

sub tag {
    my $self = shift;
    my %args = @_;
    my $attr = $args{attr};

    unless ( grep /^-/, keys %$attr ) {
        tie my %attr, 'Tie::Hash::Attribute';
        %attr = %$attr;
        $attr = \%attr;
    }

    unless (defined $args{cdata}) {
        return sprintf '%s<%s%s />%s', $self->_indent, $args{tag}, scalar( %$attr ), $self->_newline;
    }

    my $cdata = '';
    if (ref($args{cdata}) eq 'ARRAY') {

        if (ref($args{cdata}[0]) eq 'HASH') {

            $cdata .= $self->tag( %$_ ) for @{ $args{cdata} };

        } else {
            my $str = $self->{curr_level} ? $self->_newline : '';
            for (@{ $args{cdata} }) {
                $str .= $self->tag( tag => $args{tag}, attr => $attr, cdata => $_)
            }
            return $str;
        }

    } elsif (ref($args{cdata}) eq 'HASH') {
        $self->{curr_level}++;
        $cdata = $self->tag( %{ $args{cdata} } );
        $self->{curr_level}--

    } else {
        $cdata = $args{cdata};
    }
    
    return sprintf '%s<%s%s>%s</%s>%s', $self->_indent, $args{tag}, scalar( %$attr ), $cdata, $args{tag}, $self->_newline;
}

sub _indent {
    my $self = shift;
    return $self->{indent} 
        ? ($self->{indent} x $self->{curr_level})
        : '';
}

sub _newline {
    my $self = shift;
    return $self->{indent} 
        ? "\n" 
        : '';
}


1;

__END__
=head1 NAME

HTML::AutoTag - Turn data into HTML.

THIS IS AN ALPHA RELEASE - the interface could change at a ++ of $VERSION.

=head1 SYNOPSIS

  use HTML::AutoTag;

  my %attr = ( class => [qw(odd even)] );
  my @data = qw( one two three four five six seven eight );

  my $auto = HTML::AutoTag->new( indent => '    ' );

  print $auto->tag(
      tag   => 'ol', 
      cdata => [
          map { tag => 'li', attr => \%attr, cdata => $_ }, @data
      ]
  );

=head1 DESCRIPTION

This module will make some HTML, yo.

=head1 METHODS

=over 4

=item * C<new()>

Accepts two arguments:

=over 8

=item * C<encodes>

Encode HTML entities. Defaults to empty string which produces no encoding.
Set value to those characters you wish to have encoded. Set value to undef
to encode all unsafe characters.

=item * C<indent>

Pretty print results. Defaults to undef which produces no indentation.
Set value to any number of spaces or tabs and newlines will also be appended.

=back

=item * C<tag()>

Accepts three arguments:

=over 8

=item * C<tag>

The name of the tag. String.

=item * C<attr>

The attributes and values to write out for the tag. Hash reference.

=item * C<cdata>

The value inbetween the tag. Types allowed are:

=over 12

=item * scalar - the string to be wrapped in tags

=item * hash ref - another tag with its own cdata and attributes

=item * AoH - multiple tags as hash references.

=back

=back

=back

=head1 REQUIRES

=over 4

=item * C<Tie::Hash::Attribute>

Used to create rotating attributes.

=back

=head1 EXAMPLE

The following should render a table with rotating attributes. Notice the
need to supply the same reference for each <tr> attribute:

  my %tr_attr = ( class => [qw(odd even)] );
  
  print $auto->tag(
      tag => 'table',
      attr => { class => 'spreadsheet' },
      cdata => [
          {
              tag => 'tr',
              attr => \%tr_attr,
              cdata => {
                  tag => 'td',
                  attr => { style => { color => [qw(red green)] } },
                  cdata => [qw(one two three four five six)],
              },
          },
          {
              tag => 'tr',
              attr => \%tr_attr,
              cdata => {
                  tag => 'td',
                  attr => { style => { color => [qw(red green)] } },
                  cdata => [qw(seven eight nine ten eleven twelve)],
              },
          },
          {
              tag => 'tr',
              attr => \%tr_attr,
              cdata => {
                  tag => 'td',
                  attr => { style => { color => [qw(red green)] } },
                  cdata => [qw(thirteen fourteen fifteen sixteen seventeen eighteen)],
              },
          },
      ]
  );

=head1 INSPIRATION

Lincoln Stein's L<CGI> has long been able to easily produce completely
arbitrary HTML text by turning any non-defined method call into a wrapper.

Gisle Aas's L<HTML::Tree> has a wonderful method (HTML::Element::new_from_lol)
which this module draws most of its interface inspiration from. I would like
to continue tweaking this code, while the named parameters make for a clean
implementation they do get in the way of client.

=head1 BUGS AND LIMITATIONS

Please report any bugs or feature requests to either:

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
