use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Test::FITesque',
    license             => 'bsd',
    dist_author         => 'Scott McWhirter <konobi@cpan.org>',
    dist_version_from   => 'lib/Test/FITesque.pm',
    build_requires => {
        'Test::More'                => 0,
        'Test::Exception'           => 0,
    },
    requires => {
        'Test::Builder'             => '0.64_01', # output of failure changed here
        'Module::Load'              => 0,
        'Class::Data::Inheritable'  => 0,
    },
    add_to_cleanup      => [ 'Test-FITesque-*' ],
);

$builder->create_build_script();
