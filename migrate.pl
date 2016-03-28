use v5.18.4;
use strict;
use warnings;
use utf8;

use GitDDL;

my $gd = GitDDL->new(
    work_tree => './',
    ddl_file  => './schema.sql',
    dsn       => ['dbi:SQLite:./test.db'],
);

my $db_version = '';

eval {
    open my $fh, '>', \my $stderr;
     local *STDERR = $fh;
    $db_version    = $gd->database_version;
};


if (!$db_version) {
    $gd->deploy;
    say 'done migrate';

    exit;
}

if ($gd->check_version) {
    say 'Database is already latest';
}
else {
    print $gd->diff . "\n";
    $gd->upgrade_database;
    say 'done migrate';
}
