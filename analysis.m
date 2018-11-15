%Add the yin folder
addpath(genpath('yin'))

numtrials = 8;

[pre_pitch_instab, pre_dyn_instab, pre_aperiodicity, pre_error_cents, pre_error_freq] = ...
    compute_subject_descriptors(numtrials,'Pre','Musician_1');

[pre_pitch_instab_voice, pre_dyn_instab_voice, pre_aperiodicity_voice, pre_error_cents_voice, pre_error_freq_voice] = ...
    compute_subject_descriptors(numtrials,'Pre','Musician_1',1);

[feed_pitch_instab, feed_dyn_instab, feed_aperiodicity, feed_error_cents, feed_error_freq] = ...
    compute_subject_descriptors(numtrials,'Feed','Musician_1');

[feed_pitch_instab_voice, feed_dyn_instab_voice, feed_aperiodicity_voice, feed_error_cents_voice, feed_error_freq_voice] = ...
    compute_subject_descriptors(numtrials,'Feed','Musician_1',1);

[post_pitch_instab, post_dyn_instab, post_aperiodicity, post_error_cents, post_error_freq] = ...
    compute_subject_descriptors(numtrials,'Post','Musician_1');

[post_pitch_instab_voice, post_dyn_instab_voice, post_aperiodicity_voice, post_error_cents_voice, post_error_freq_voice] = ...
    compute_subject_descriptors(numtrials,'Post','Musician_1',1);


