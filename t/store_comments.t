use strict;
use warnings;
use Test::More;
use Web::Query::LibXML;
use Data::Dumper;

my $source = '<header><!-- header --></header>';

is join('', wq($source)->as_html), $source, 'constructor stores comments';

is wq($source)->find('header')->html('<p><!-- comment --></p>')->as_html, '<header><p><!-- comment --></p></header>', 'html() stores comments';


done_testing;