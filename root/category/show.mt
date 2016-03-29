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

<table class="jobs">
? my $i = 0;
? for my $job ($category->get_active_jobs) {
  <tr class="<?= $i++ % 2 ? 'evel' : 'odd' ?>">
    <td class="location">
      <?= $job->location ?>
    </td>
    <td class="position">
      <?= $job->position ?>
    </td>
    <td class="company">
      <?= $job->company ?>
    </td>
  </tr>
? } # endfor $job
</table>

? } # endblock content
