package Jobeet::Schema::ResultBase;
use v5.18.4;
use strict;
use warnings;
use utf8;

use parent 'DBIx::Class';

__PACKAGE__->load_components(qw/InflateColumn::DateTime Core/);


1;
