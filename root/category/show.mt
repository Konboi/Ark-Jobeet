? my $category = $c->stash->{category};

? extends 'common/base';

? extends 'common/jobs_base';

? block title => sub { sprintf 'Jobs in the %s category', $category->name };

? block content => sub {
<div class="category">
  <div class="feed">
    <a href="">Feed</a>
  </div>
  <h1><?= $category->name ?></h1>
</div>

?= include('job/_partial_jobs', $category->get_active_jobs);

? } # endblock content
