package Jobeet::Schema::Result::Affiliate;
use v5.18.4;
use strict;
use warnings;
use parent 'Jobeet::Schema::ResultBase';
use Jobeet::Schema::Types;

__PACKAGE__->table('jobeet_affiliate');

__PACKAGE__->add_columns(
    id    => PK_INTEGER,
    url   => VARCHAR,
    email => VARCHAR,
    token => VARCHAR(
        size => 80,
    ),
    is_active  => TINYINT,,
    created_at => DATETIME,,
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->add_unique_constraint(['email']);

1;
