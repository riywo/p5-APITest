use strict;
use warnings;
use utf8;
use 5.0100000;

package APITest;
use Plack::Client;
use Plack::Util;

sub new {
    my $klass = shift;
    my $self = {
        (@_ == 1 && ref($_[0]) eq 'HASH' ? %{$_[0]} : @_),
    };

    die unless exists $self->{server};
    my ($proto, $path) = _parse_server($self->{server});
    if ($proto eq 'psgi-local') {
        $self->{client} = Plack::Client->new(
            'psgi-local' => {
                apps => { $path => Plack::Util::load_psgi($path) },
            },
        );
    } else {
        $self->{client} = Plack::Client->new(http => {});
    }

    bless $self, $klass;
    return $self;
}

sub get {
    my ($self, $path) = @_;
    return $self->{client}->get($self->{server}.$path);
}

sub _parse_server {
    my $server = shift;
    return ($server =~ /^([^:]+):\/\/(.+)$/);
}


1;
