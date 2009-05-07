#!/usr/bin/perl -T

use strict;
use warnings;

use Test::Builder::Tester tests => 1;
use Test::More;
use Test::FITesque::Test;

use lib 't/lib';

Basic_test_builder_sanity: {
  my $test = Test::FITesque::Test->new();
  $test->add('Buddha::TestRun');
  $test->add('foo');
  $test->add('click me');
  $test->add('fail_this');

  test_out("1..4");
  test_out("# running foo (1 tests)");
  test_out("ok 1 - foo ran just fine");
  test_out("# running click me (2 tests)");
  test_out("ok 2 - click_me: first");
  test_out("ok 3 - click_me: second");
  test_out("# running fail_this (1 tests)");
  test_out("not ok 4 - fail_this");
  test_err(qr{#\s+Failed\ test.*?\n?.*?at\ t/lib/Buddha/TestRun\.pm\ (?:at\ )?line 23.*\n?});
  
  $test->run_tests();

  test_test(title => q{run_tests worked as expected});
}

