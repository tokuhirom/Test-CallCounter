use inc::Module::Install;
use Module::Install::AuthorTests;

name 'Test-CallCount';
all_from 'lib/Test/CallCount.pm';

requires 'Class::Method::Modifier';
requires 'parent';
requires 'Exporter';

tests 't/*.t t/*/*.t t/*/*/*.t t/*/*/*/*.t';
test_requires 'Test::More' => 0.96; # done_testing, subtest
author_tests('xt');
WriteAll;
