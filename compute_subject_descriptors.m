function [ mean_pitch_instab, mean_dyn_instab, mean_aperiodicity, error_cents, error_freq ] = compute_subject_descriptors( numtrials, path_dir, n_subject, voice )
%COMPUTE_SUBJECT_DESCRIPTORS 
if nargin < 4
  voice = 0;
end

%  %Initialize Audio Descriptors
mean_pitch_instab = zeros(numtrials,1)';
mean_dyn_instab = zeros(numtrials,1)';
mean_timbre_stab = zeros(numtrials,1)';
mean_aperiodicity = zeros(numtrials,1)';
error_cents = zeros(numtrials,1)';
error_freq = zeros(numtrials,1)';

%Compute descriptors for violin notes
for i=1:numtrials
    %We read the audio file
    if voice == 0
        [x,fs] = audioread([n_subject,'\',path_dir,'\audios\Note',num2str(i),'_audio.wav']);    
        %Open Tony file
        m = csvread([n_subject,'\',path_dir,'\audios\Note',num2str(i),'_tony.csv']);
    else
        [x,fs] = audioread([n_subject,'\',path_dir,'\audios\Note',num2str(i),'_sing_audio.wav']);    
        %Open Tony file
        m = csvread([n_subject,'\',path_dir,'\audios\Note',num2str(i),'_sing_tony.csv']);
    end
    %Check reference note
    %pitch_ref = m(1,2);
    n=1;
    for j=2:size(m,1)
        %Compute audio descriptors with Yin
        pitch_instab = zeros(size(m,1),1)';
        dyn_instab = zeros(size(m,1),1)';
        aperiodicity = zeros(size(m,1),1)';
        R = struct;
        if floor(m(j,1)*fs + m(j,3)*fs) > length(x)
            R = yin(x(floor(m(j,1)*fs):end),fs);
        else
            R = yin(x(floor(m(j,1)*fs):floor(m(j,1)*fs + m(j,3)*fs)),fs);
        end
         %Extract relevant values of f0
        f0=R.f0(~isnan(R.f0));
        %Extract relevant values of power
        Pwr = R.pwr(~isnan(R.pwr));
        %Convert power to Decibels
        Pwr_Db = 10*log10(Pwr);
        %Extract aperiodicity values
        ap = R.ap(~isnan(R.ap));
        %Compute Descriptors
        pitch_instab(n) = nanstd(f0);
        dyn_instab(n)   = nanstd(Pwr_Db);
        aperiodicity(n) = nanmean(ap);
        n=n+1;
    end
    
    mean_pitch_instab(i) = nanmean(pitch_instab);
    mean_dyn_instab(i) = nanmean(dyn_instab);
    mean_aperiodicity(i) = nanmean(aperiodicity);
    
    freq_int = m(1,2)/m(size(m,1),2);
    error_cents(i) = freq2cents(freq_int);
    error_freq(i) = m(1,2)-m(size(m,1),2);
    if error_freq(i) < 0
        error_cents(i) = -error_cents(i);
    end
    
end





end

