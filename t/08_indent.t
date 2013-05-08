use strict;
use warnings;

use Test::More;
use Web::Query::LibXML;

my $inner = "<head></head><body><p>Hi there</p></body>";
my $html = "<html>$inner</html>";

is( Web::Query::LibXML->new($html)->html => '<head/><body><p>Hi there</p></body>', "no indent" );

# NOTE HTML::TreeBuilder::LibXML::Node::as_HTML does not support indent
#like( Web::Query::LibXML->new($html, { indent => "\t" } )->html => qr/\t/, "indented" );

done_testing;