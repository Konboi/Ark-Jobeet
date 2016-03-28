package Jobeet::Schema::Result::CategoryAffiliate;
use strict;
use warnings;
use parent 'Jobeet::Schema::ResultBase';
use Jobeet::Schema::Types;

__PACKAGE__->table('jobeet_category_affiliate');

__PACKAGE__->add_columns(
    category_id  => PK_INTEGER,
    affiliate_id => INTEGER,
);

__PACKAGE__->set_primary_key(qw/category_id affiliate_id/);

1;
