#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;
use HTML::AutoTag;

eval "use HTML::Tagset";
plan skip_all => "HTML::Tagset required" if $@;

plan tests => 174;

my ( @empty, %empty, @containers, %containers );
{   no warnings;
    @empty = (
        ( keys %HTML::Tagset::emptyElement ),
        ( keys %HTML::Tagset::optionalEndTag ),
    );
    %empty = map { $_ => undef } @empty;

    @containers = (
        ( keys %HTML::Tagset::optionalEndTag ),
        ( keys %HTML::Tagset::isPhraseMarkup ),
        ( keys %HTML::Tagset::isHeadElement ),
        ( keys %HTML::Tagset::isList ),
        ( keys %HTML::Tagset::isTableElement ),
        ( keys %HTML::Tagset::isFormElement ),
        ( keys %HTML::Tagset::isBodyElement ),
        ( keys %HTML::Tagset::isHeadOrBodyElement ),
        ( keys %HTML::Tagset::isKnown ),
    );
    %containers = map { $_ => undef } @containers;
}

my $auto = HTML::AutoTag->new( indent => '' );

my @given;
push @given, $auto->tag( tag => $_ ) for sort keys %empty;
push @given, $auto->tag( tag => $_, cdata => '' ) for sort keys %containers;

for (sort keys %HTML::Tagset::linkElements) {
    my $attr = { map { $_ => 'value' } @{ $HTML::Tagset::linkElements{$_} } };
    push @given, $auto->tag( tag => $_, attr => $attr, cdata => '' );
}

for (sort keys %HTML::Tagset::boolean_attr) {
    my $thingy = $HTML::Tagset::boolean_attr{$_};
    my $attr = ref($thingy) eq 'HASH' ? $thingy : { $thingy => 1 };
    push @given, $auto->tag( tag => $_, attr => $attr, cdata => '' );
}

for (@given) {
    chomp( $_ );
    is "$_\n", <DATA>,  "correctly formed: $_";
}

__DATA__
<area />
<base />
<basefont />
<bgsound />
<br />
<col />
<dd />
<dt />
<embed />
<frame />
<hr />
<img />
<input />
<isindex />
<li />
<link />
<meta />
<p />
<param />
<spacer />
<wbr />
<~comment />
<~declaration />
<~literal />
<~pi />
<a></a>
<abbr></abbr>
<acronym></acronym>
<address></address>
<applet></applet>
<area></area>
<b></b>
<base></base>
<basefont></basefont>
<bdo></bdo>
<bgsound></bgsound>
<big></big>
<blink></blink>
<blockquote></blockquote>
<body></body>
<br></br>
<button></button>
<caption></caption>
<center></center>
<cite></cite>
<code></code>
<col></col>
<colgroup></colgroup>
<dd></dd>
<del></del>
<dfn></dfn>
<dir></dir>
<div></div>
<dl></dl>
<dt></dt>
<em></em>
<embed></embed>
<fieldset></fieldset>
<font></font>
<form></form>
<frame></frame>
<frameset></frameset>
<h1></h1>
<h2></h2>
<h3></h3>
<h4></h4>
<h5></h5>
<h6></h6>
<head></head>
<hr></hr>
<html></html>
<i></i>
<iframe></iframe>
<ilayer></ilayer>
<img></img>
<input></input>
<ins></ins>
<isindex></isindex>
<kbd></kbd>
<label></label>
<legend></legend>
<li></li>
<link></link>
<listing></listing>
<map></map>
<menu></menu>
<meta></meta>
<multicol></multicol>
<nobr></nobr>
<noembed></noembed>
<noframes></noframes>
<nolayer></nolayer>
<noscript></noscript>
<object></object>
<ol></ol>
<optgroup></optgroup>
<option></option>
<p></p>
<param></param>
<plaintext></plaintext>
<pre></pre>
<q></q>
<s></s>
<samp></samp>
<script></script>
<select></select>
<small></small>
<spacer></spacer>
<span></span>
<strike></strike>
<strong></strong>
<style></style>
<sub></sub>
<sup></sup>
<table></table>
<tbody></tbody>
<td></td>
<textarea></textarea>
<tfoot></tfoot>
<th></th>
<thead></thead>
<title></title>
<tr></tr>
<tt></tt>
<u></u>
<ul></ul>
<var></var>
<wbr></wbr>
<xmp></xmp>
<~comment></~comment>
<~directive></~directive>
<~literal></~literal>
<~pi></~pi>
<a href="value"></a>
<applet archive="value" code="value" codebase="value"></applet>
<area href="value"></area>
<base href="value"></base>
<bgsound src="value"></bgsound>
<blockquote cite="value"></blockquote>
<body background="value"></body>
<del cite="value"></del>
<embed pluginspage="value" src="value"></embed>
<form action="value"></form>
<frame longdesc="value" src="value"></frame>
<head profile="value"></head>
<iframe longdesc="value" src="value"></iframe>
<ilayer background="value"></ilayer>
<img longdesc="value" lowsrc="value" src="value" usemap="value"></img>
<input src="value" usemap="value"></input>
<ins cite="value"></ins>
<isindex action="value"></isindex>
<layer background="value" src="value"></layer>
<link href="value"></link>
<object archive="value" classid="value" codebase="value" data="value" usemap="value"></object>
<q cite="value"></q>
<script for="value" src="value"></script>
<table background="value"></table>
<td background="value"></td>
<th background="value"></th>
<tr background="value"></tr>
<xmp href="value"></xmp>
<area nohref="1"></area>
<dir compact="1"></dir>
<dl compact="1"></dl>
<hr noshade="1"></hr>
<img ismap="1"></img>
<input checked="1" disabled="1" readonly="1"></input>
<menu compact="1"></menu>
<ol compact="1"></ol>
<option selected="1"></option>
<select multiple="1"></select>
<td nowrap="1"></td>
<th nowrap="1"></th>
<ul compact="1"></ul>
