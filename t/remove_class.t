#!/usr/bin/env perl
use strict;
use warnings;
use lib 'lib';
use Test::More;
use Web::Query::LibXML;

my $wq = wq('<div class="container"><div class="inner">Hello</div><div class="inner">Goodbye</div></div>');

my $rv = $wq->find('.inner')->remove_class('foo bar');
isa_ok $rv, 'Web::Query', 'remove_class returned';
#diag $wq->as_html;
is $wq->as_html, '<div class="container"><div class="inner">Hello</div><div class="inner">Goodbye</div></div>', 'remove_class("foo bar")';

$wq = wq('<div class="container"><div class="inner">Hello</div><div class="inner">Goodbye</div></div>');

$wq->find('.inner')->remove_class(sub{ 'foo bar' });
is $wq->as_html, '<div class="container"><div class="inner">Hello</div><div class="inner">Goodbye</div></div>', 'remove_class(CODE)';

done_testing;