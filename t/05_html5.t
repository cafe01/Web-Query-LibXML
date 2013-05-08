use strict;
use warnings;
use utf8;
use Test::More;
use Web::Query::LibXML qw/wq/;

is(wq('<html><header>foo<p>bar</p>baz</header></html>')->find('header')->first->as_html, '<header>foo<p>bar</p>baz</header>');

done_testing;

