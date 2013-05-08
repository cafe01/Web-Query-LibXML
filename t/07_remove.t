# -*- perl -*-
use strict;
use warnings;
use utf8;
use Test::More;
use Web::Query::LibXML;

subtest "remove and size" => sub {
    my $q = wq('t/data/foo.html');
    $q->find('.foo')->remove();
    is $q->find('.foo')->size() => 0, "all .foo are removed and cannot be found.";
};

subtest "remove and html" => sub {
    my $q = wq('t/data/foo.html');
    $q->find('.foo, .bar')->remove();
    like $q->html, qr{<head><title>test1</title></head><body>\s*</body>}, ".foo and .bar are removed and not showing in html";
};

subtest "\$q->remove->end->html" => sub {
    my $q = wq('t/data/foo.html');
    like(
        $q->find('.foo, .bar')->remove->end->html,
        qr{<head><title>test1</title></head><body>\s*</body>},
        "The chainning works."
    );
};

subtest "remove root elements" => sub {
    my $q = wq('t/data/foo.html');
    $q->remove;
    is $q->size, 0, "size 0 after remove";
    is join('', $q->as_html), '', "html '' after remove"; # not '<></>'
};

subtest "remove root elements after find" => sub {
    my $q = wq('t/data/foo.html');
    $q->find('html')->remove;
    is $q->size, 0, "size 0 after remove";
    is join('', $q->as_html), '', "html '' after remove"; # not '<></>'
};

subtest "remove root elements via each()" => sub {
    my $q = wq('t/data/foo.html');
    $q->find('html')->each(sub{ $_->remove });
    is $q->size, 0, "size 0 after remove";
    is join('', $q->as_html), '', "html '' after remove"; # not '<></>'
};



done_testing;
