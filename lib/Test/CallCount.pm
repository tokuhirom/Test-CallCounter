package Test::CallCount;
use strict;
use warnings;
use parent qw(Exporter);
use 5.008001;
our $VERSION = '0.01';

our @EXPORT = qw(add_counter get_count reset_counter);

use Class::Method::Modifiers qw(install_modifier);

our $COUNTER;

sub add_counter {
    my ($klass, $method) = @_;
    install_modifier(
        $klass, 'before', $method, sub {
            $COUNTER->{$klass}->{$method}++;
        }
    );
}

sub get_count {
    my ($klass, $method) = @_;
    $COUNTER->{$klass}->{$method};
}

sub reset_counter {
    my ($klass, $method) = @_;
    if (@_==2) {
        delete $COUNTER->{$klass}->{$method};
    } elsif (@_==1) {
        delete $COUNTER->{$klass};
    } else {
        undef $COUNTER;
    }
}

1;
__END__

=encoding utf8

=head1 NAME

Test::CallCount - Count the number of method calling

=head1 SYNOPSIS

    use Test::CallCount;

    add_counter('LWP::UserAgent' => 'get');

    my $ua = LWP::UserAgent->new();
    $ua->get('http://d.hatena.ne.jp/');

    is(get_count('LWP::UserAgent', 'get'), 1);

=head1 DESCRIPTION

Test::CallCount counts the number of method calling.

=head1 FUNCTIONS

=over 4

=item add_counter($class_name, $method_name)

    add_counter('LWP::UserAgent' => 'get');

Make a hook.

=item get_counter($class_name, $method_name)

    get_count('LWP::UserAgent', 'get')

Get a calling count of C<< $method_name >>.

=item reset_counter($class_name, $method_name)

Reset counter for C<< $class_name#$method_name >>.

=item reset_counter($class_name)

Reset counter for C<< $class_name >>.

=item reset_counter()

Reset counter for all classes.

=back

=head1 AUTHOR

Tokuhiro Matsuno E<lt>tokuhirom@gmail.comE<gt>

=head1 SEE ALSO

L<Test::Mock::Guard>

=head1 LICENSE

Copyright (C) Tokuhiro Matsuno

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
