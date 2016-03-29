package Jobeet::Schema::Result::Category;
use v5.18.4;
use strict;
use warnings;
use parent 'Jobeet::Schema::ResultBase';

use Jobeet::Models;
use Jobeet::Schema::Types;


__PACKAGE__->table('jobeet_category');

__PACKAGE__->add_columns(
    id   => PK_INTEGER,
    name => VARCHAR,
    slug => VARCHAR(
        is_nullable => 1,
    ),
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->add_unique_constraint(['name']);
__PACKAGE__->add_unique_constraint(['slug']);

__PACKAGE__->has_many(
    jobs => 'Jobeet::Schema::Result::Job', 'category_id',
{
    is_foreign_key_constraint   => 0,
    cascade_delete              => 0,
},
);

__PACKAGE__->has_many(
    category_affiliate => 'Jobeet::Schema::Result::CategoryAffiliate', 'category_id'
);

sub get_active_jobs {
    my $self = shift;
    my $attr = shift || {};

    $attr->{rows} ||= models('conf')->{max_jobs_on_homepage};

    $self->jobs(
        { expires_at => { '>=', models('Schema')->now } },
        { order_by   => { -desc => 'created_at' },
          rows       => $attr->{rows},
        }
    );
}

1;
