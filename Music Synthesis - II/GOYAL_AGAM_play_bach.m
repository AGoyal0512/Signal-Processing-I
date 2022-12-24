load bach_fugue.mat

X = 1;
fs = 22050;
beats_per_min = 60;

beats_per_sec = beats_per_min/60;
sec_per_beat = 1/beats_per_sec;
sec_per_pulse = sec_per_beat/4;

tt = 0:(1/fs):250*sec_per_pulse;
xx = zeros(1, length(tt));

for i = 1:3
    for j = 1:length(theVoices(i).startPulses)
        keynum = theVoices(i).noteNumbers(j);
        tone = key2note(X, keynum, theVoices(i).durations(j) * sec_per_pulse, fs);
        note_indx_start = round((theVoices(i).startPulses(j)-1) * sec_per_pulse * fs);
        note_indx_stop = note_indx_start + length(tone) - 1;
        xx(note_indx_start:note_indx_stop) = xx(note_indx_start:note_indx_stop) + tone;
    end
end

soundsc(xx, fs)