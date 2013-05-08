package Web::Query::LibXML;
use 5.008005;
use strict;
use warnings;
use parent qw/Web::Query Exporter/;
use HTML::TreeBuilder::LibXML;


our $VERSION = "0.01";

our @EXPORT = qw/wq/;

sub wq { Web::Query::LibXML->new(@_) }

sub _build_tree {
    my ($self, $content) = @_;    
    my $tree = HTML::TreeBuilder::LibXML->new();
    $tree->ignore_unknown(0);
    $tree->store_comments(1);
    $tree;    
}










1;
__END__

=encoding utf-8

=head1 NAME

Web::Query::LibXML - drop-in replacement for Web::Query, based on XML::LibXML

=head1 SYNOPSIS

    use Web::Query::LibXML;

=head1 DESCRIPTION

Web::Query::LibXML is ...

=head1 LICENSE

Copyright (C) Carlos Fernando Avila Gratz.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Carlos Fernando Avila Gratz E<lt>cafe@q1software.comE<gt>

=cut

