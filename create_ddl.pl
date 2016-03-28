use v5.18.4;
use strict;
use warnings;
use utf8;

use lib 'lib';

use Jobeet::Schema;
use SQL::Translator;
use DBIx::Class::Optional::Dependencies;
use Path::Class;

my $schema = Jobeet::Schema->connect('dbi:SQLite:./test.db');
my $sql_file = './schema.sql';
my $file     = Path::Class::file($sql_file);

my $output = $schema->deployment_statements(
    undef, undef, undef, {
        no_comments    => 1,
        add_drop_table => 1,
    }
);

$file->parent->mkpath;
$file->spew( iomode => '>:encoding(UTF-8)', $output );
