# NAME

Test::CallCount - Count the number of method calling

# SYNOPSIS

    use Test::CallCount;

    add_counter('LWP::UserAgent' => 'get');

    my $ua = LWP::UserAgent->new();
    $ua->get('http://d.hatena.ne.jp/');

    is(get_count('LWP::UserAgent', 'get'), 1);

# DESCRIPTION

Test::CallCount counts the number of method calling.

# FUNCTIONS

- add\_counter($class\_name, $method\_name)

        add_counter('LWP::UserAgent' => 'get');

    Make a hook.

- get\_counter($class\_name, $method\_name)

        get_count('LWP::UserAgent', 'get')

    Get a calling count of `$method_name`.

- reset\_counter($class\_name, $method\_name)

    Reset counter for `$class_name#$method_name`.

- reset\_counter($class\_name)

    Reset counter for `$class_name`.

- reset\_counter()

    Reset counter for all classes.

# AUTHOR

Tokuhiro Matsuno <tokuhirom@gmail.com>

# SEE ALSO

[Test::Mock::Guard](http://search.cpan.org/perldoc?Test::Mock::Guard)

# LICENSE

Copyright (C) Tokuhiro Matsuno

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
