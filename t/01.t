# -*- perl -*-

use Test::More;
BEGIN { plan tests => 202 };
use Class::Iterator;

my $it = Class::Iterator->new(sub { my $i = 0; 
				    return sub { $i < 100 ? $i++ : undef}
				});

# test creation
ok $it;
#diag($it->next);
# test next method
my $v = 0 ;
while (defined(my $n = $it->next)) {
    ok ($v++ == $n);
}


# test the init method
$it->init;
my $v = 0 ;
while (defined(my $n = $it->next)) {
    ok ($v++ == $n);
}

# test the default construct
undef $it;
$it = Class::Iterator->new;
ok (! defined($it->next));
