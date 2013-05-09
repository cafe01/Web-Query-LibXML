#!/usr/bin/env perl

use strict;
use warnings;
use lib 'lib';
use Test::More;
use Web::Query::LibXML;

my $html = '<div class="container"><div class="inner">Hello</div><div class="inner">Goodbye</div></div>';

is wq($html)->find('.inner')->before('<p>Test</p>')->end->as_html, 
    '<div class="container"><p>Test</p><div class="inner">Hello</div><p>Test</p><div class="inner">Goodbye</div></div>', 'before';

done_testing;