package App::gh::Command::Setup;
use warnings;
use strict;

sub run {
    my $self = shift;
    my ( $type , $id , $arg ) = @_;

    die unless ( $type && $id && $arg );

    if( $type eq 'github' || $type eq 'gh' ) {
        qx(git config --global github.user "$id");
        qx(git config --global github.token "$arg");
    }
    elsif( $type eq 'git' ) {
        qx( git config --global user.name "$id" );
        qx( git config --global user.email "$arg" );
    }

    print "Done\n";
}




1;
__END__
=head1 NAME

App::gh::Command::Setup - setup command

=head1 USAGE

    $ gh setup github [github id] [github token]

    $ gh setup git [user id] [user token]

=head1 STEPS

    $ git config --global user.name "Tekkub"
    $ git config --global user.email "tekkub@gmail.com"

    $ git config --global github.user tekkub
    $ git config --global github.token 0123456789abcdef0123456789abcdef

=cut
