package Jobeet::Schema::ResultSet::Job;
use strict;
use warnings;
use utf8;
use parent 'DBIx::Class::ResultSet';

use Jobeet::Models;

sub get_active_jobs {
    my $self = shift;

    $self = $self->search({ expires_at => { '>=', models('Schema')->now }, });

    $self;
}

1;
