use strict;
use warnings;
use utf8;
use Test::More;
use Test::CallCount;

use File::Spec;

add_counter('File::Spec' => 'tmpdir');

File::Spec->tmpdir;

is(get_count('File::Spec', 'tmpdir'), 1);

done_testing;

