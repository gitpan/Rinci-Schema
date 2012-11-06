
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Schemas for Rinci metadata",
  "dist_author" => [
    "Steven Haryanto <stevenharyanto\@gmail.com>"
  ],
  "dist_name" => "Rinci-Schema",
  "dist_version" => "1.1.32.1",
  "license" => "perl",
  "module_name" => "Rinci::Schema",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Rinci" => "v1.1.32"
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
