function res = my_lowpass(st, fs, f_pass)
    len = length(st);
    st_fft = fft(st);
    df = fs/len;
    for i = fix(f_pass/df+1):len
        st_fft(i) = 0;
    end
    for i = 2:len/2+1
    idx = len - i +3;
    st_fft(idx) = conj(st_fft(i));
    end
    res = ifft(st_fft);
    %»­³öÂË²¨Æ÷Ê±Óòsincº¯Êý
    lowpass = [];
    for i = 1:fix(f_pass/df)
        lowpass = [lowpass 1];
    end
    for i = fix(f_pass/df+1):len
        lowpass = [lowpass 0];
    end
    for i = 2:len/2+1
    idx = len - i +3;
    lowpass(idx) = conj(lowpass(i));
    end
    lowpass_t = ifft(lowpass);
end