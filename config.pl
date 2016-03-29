my $home = Jobeet::Models->get('home');

return {
    database => [
        'dbi:SQLite:' . $home->file('database.db'), '', '',
    {
        sqlite_unicode => 1,
    },
    ],

    default_view         => 'MT',
    active_days          => 30,
    max_jobs_on_homepage => 10,
};
