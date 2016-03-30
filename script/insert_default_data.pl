use warnings;
use strict;

use FindBin::libs;

use DateTime;
use Jobeet::Models;

my $datafile = models('home')->subdir(qw/sql fixtures/)->file('default.pl');
do $datafile or die $!;
