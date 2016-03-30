use Test::More;
use CGI::Simple;

use_ok 'Jobeet::Form::Job';

{
    my $f = Jobeet::Form::Job->new(
        CGI::Simple->new({
            category     => 'design',
            type         => 'full-time',
            company      => 'Sensio Labs',
            url          => 'http://www.sensio.com/',
            position     => 'Developer',
            location     => 'Atlanta, USA',
            description  =>
                'You will work with symfony to develop websites for our customers.',
            how_to_apply => 'Send me an email',
            email        => 'for.a.job@example.com',
        }),
    );

    ok $f->submitted_and_valid, 'form submitted_and_valid ok';
}

done_testing;
