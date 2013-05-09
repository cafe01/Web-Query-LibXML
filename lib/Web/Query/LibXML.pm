package Web::Query::LibXML;
use 5.008005;
use strict;
use warnings;
use parent qw/Web::Query Exporter/;
use HTML::TreeBuilder::LibXML;
use HTML::Selector::XPath 0.06 qw/selector_to_xpath/;


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



sub find {
    my ($self, $selector) = @_;
    my $xpath_rootless = selector_to_xpath($selector);
    
    my @new;
    for my $tree (@{$self->{trees}}) {
        my $is_root = ref $tree->parent->{node} eq 'XML::LibXML::Document';
        push @new, $tree if !$is_root && $tree->matches($xpath_rootless);
        push @new, $tree->findnodes(selector_to_xpath($selector, root => $is_root ? '/' : './'));
    }
    
    return (ref $self || $self)->new_from_element(\@new, $self);
}



sub remove {
    my $self = shift;
    my $before = $self->end;
    
    while (defined $before) {
        @{$before->{trees}} = grep {
            my $el = $_;            
            not grep { $el->{node}->isSameNode($_->{node}) } @{$self->{trees}};            
        } @{$before->{trees}};

        $before = $before->end;
    }
    
    $_->delete for @{$self->{trees}};
    @{$self->{trees}} = ();
    
    $self;
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

