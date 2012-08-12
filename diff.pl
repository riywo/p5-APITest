use strict;
use warnings;
use utf8;
use File::Spec;
use File::Basename;
use lib File::Spec->catdir(dirname(__FILE__), 'extlib', 'lib', 'perl5');
use lib File::Spec->catdir(dirname(__FILE__), 'lib');
use APITest;
use Data::Dumper;
local $Data::Dumper::Sortkeys = 1;
local $Data::Dumper::Indent = 1;
local $Data::Dumper::Terse = 1;
use Text::Diff;

my $local = APITest->new(server  => 'psgi-local://app.psgi');
my $server = APITest->new(server  => 'http://localhost:5000');

print diff \Dumper($local), \Dumper($server), { STYLE => 'Table' };
print diff \Dumper($local->get('/')), \Dumper($server->get('/')), { STYLE => 'Table' };
