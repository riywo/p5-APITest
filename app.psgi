use strict;
use warnings;
use utf8;
use File::Spec;
use File::Basename;
use lib File::Spec->catdir(dirname(__FILE__), 'extlib', 'lib', 'perl5');
use lib File::Spec->catdir(dirname(__FILE__), 'lib');
use Amon2::Lite;

our $VERSION = '0.01';

get '/' => sub {
    my $c = shift;
    return $c->render_json(+{aaa => 1});
};

# load plugins
__PACKAGE__->load_plugin('Web::JSON');
__PACKAGE__->to_app;
