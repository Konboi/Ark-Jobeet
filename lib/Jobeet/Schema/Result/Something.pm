package Jobeet::Schema::Result::Something;

use parent 'Jobeet::Schema::ResultBase';

use Jobeet::Models;
use Jobeet::Schema::Types;

__PACKAGE__->table('jobeet_something');

__PACKAGE__->add_columns(
    json_colummn1 => {
        data_type   => 'VARCHAR',
        size        => 255,
        is_nullable => 0,
    },

    json_colummn2 => {
        data_type   => 'VARCHAR',
        size        => 255,
        is_nullable => 0,
    },
);

__PACKAGE__->inflate_json_column(qw/json_colummn1 json_colummn2/);

1;
