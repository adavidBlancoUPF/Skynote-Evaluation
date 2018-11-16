


exp_pre = [mean(pre_error_cents),mean(pre_error_cents_voice)];
exp_feed = [mean(feed_error_cents),mean(feed_error_cents_voice)];
exp_post = [mean(post_error_cents),mean(post_error_cents_voice)];

exp_pre_std = [std(pre_error_cents),std(pre_error_cents_voice)];
exp_feed_std = [std(feed_error_cents),std(feed_error_cents_voice)];
exp_post_std = [std(post_error_cents),std(post_error_cents_voice)];

errorbar_groups([exp_pre;exp_feed;exp_post],...
    [exp_pre_std;exp_feed_std;exp_post_std],'bar_names',{'violin','voice'});