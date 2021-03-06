#!/usr/bin/env perl
use strict;
use warnings;
use lib 'lib';
use Test::More;
use Web::Query::LibXML;

my $html = '<div class="container"><div class="inner">Hello</div><div class="inner">Goodbye</div></div>';

is wq($html)->find('.inner')->prepend('<p>Test</p>')->end->as_html, 
    '<div class="container"><div class="inner"><p>Test</p>Hello</div><div class="inner"><p>Test</p>Goodbye</div></div>', 'prepend';

done_testing;