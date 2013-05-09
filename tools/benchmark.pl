#!/usr/bin/env perl
#
#  AUTHOR: cafe
#  DATE: Apr 21, 2013 
#  ABSTRACT: abstract

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";
use lib "$ENV{HOME}/workspace/html--treebuilder--libxml/lib";
use lib "$ENV{HOME}/workspace/Web-Query-LibXML/lib"; 
use Web::Query;
use Web::Query::LibXML;
use Data::Printer;
#use Data::Dumper;

use Benchmark qw(cmpthese) ;



open(FILE, '<', "$FindBin::Bin/publichd.html") or die $!;
my $html = join '', <FILE>;




cmpthese($ARGV[0] || 100, {
    'Web-Query' => build_sub('Web::Query'),
    'Web-Query-LibXML' => build_sub('Web::Query::LibXML')    
});




sub build_sub {
    my ($class) = @_;
    
        
    sub {
        my $wq = $class->new($html);
        $wq->find("#torrbg tr")->each(sub{
            my $i = shift;
            return if $i == 0;
            
            my $item = {};
            
            $item->{title} = $_->find('td')->first->text;
            #$item->{title} = $_->find('td:nth-child(2) a')->text;
            #$item->{url} = $_->find('td:nth-child(3) a:last-child')->attr('href');
            
            #p $item;            
        });        
    }    
}







 




