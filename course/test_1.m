fs = 100000;                   %10kHz
Ts = 0.001;
Rs = 1/Ts;
% code_1 = randi([0 1],10000,1);
% code_1 = code_1';
code_1 = [0 1 0 1 0 1 0 1];
dt = 1/fs;
t = 0:dt:Ts*length(code_1);                     %时间区间
rolloff = 0.5;
span = 10;
sps = fs/Rs;
Pb = [];


pam = mypam(code_1, fs, Ts);
% pam = cos(2*pi*Rs*t);
%生成匹配滤波器
match_filter_1 = [];
for i = 1:Ts*fs
    match_filter_1 = [match_filter_1 1];
end
match_out_1_org = conv(pam,match_filter_1);
%不同噪声条件下
% for SNR = -20:1
%     pam_noise = awgn(pam, SNR);
%     [pam_out, lowpass_t] = my_lowpass(pam_noise, fs, 2*Rs);
%     %升余弦滤波器
%     % hrc = rcosdesign(rolloff, span, sps);
%     % pam_cos_out = conv(pam_out, hrc);
%     % subplot(1,2,2)
%     % plot(pam_cos_out)
% 
%     match_out_1 = conv(pam_out,match_filter_1);
% 
%     %计算前后码元的影响
%     % impact = match_out_1_org(2*Ts*fs) * lowpass_t(1);
%     % for i = 1:Ts*fs
%     %     impact = impact + lowpass_t(i+1) * (match_out_1_org(2*Ts*fs+i));
%     % end
%     % impact = impact * 2;
% 
%     % eyediagram(pam_out, sps);
%     % eyediagram(pam_cos_out, sps);
% 
% 
% 
%     %判决
%     code_out_1 = [];
%     for i = Ts*fs:Ts*fs:length(pam)
%         if match_out_1(i) > 0
%             code_out_1 = [code_out_1 1];
%         else
%             code_out_1 = [code_out_1 0];
%         end
%     end
%     %计算误码率
%     [number,ratio] = biterr(code_1,code_out_1);
%     Pb = [Pb ratio];
% end
pam_noise = awgn(pam, -50);
[pam_out_1, lowpass_t] = my_lowpass(pam, fs, 3*Rs);
% hrc = rcosdesign(rolloff, span, sps);
% pam_out_1 = conv(pam_out_1, hrc);
eyediagram(pam_out_1, sps, sps, sps/2);
[pam_out_2, lowpass_t] = my_lowpass(pam, fs, 3*Rs);
match_out_1 = conv(pam_out_1,match_filter_1);
match_out_2 = conv(pam_out_2,match_filter_1);
%判决
code_out_1 = [];
code_out_2 = [];
for i = Ts*fs:Ts*fs:length(pam)
    if match_out_1(i) > 0
        code_out_1 = [code_out_1 1];
    else
        code_out_1 = [code_out_1 0];
    end
end
for i = Ts*fs:Ts*fs:length(pam)
    if match_out_1(i) > 0
        code_out_2 = [code_out_2 1];
    else
        code_out_2 = [code_out_2 0];
    end
end
%计算误码率
[number_1,ratio_1] = biterr(code_1,code_out_1)
[number_2,ratio_2] = biterr(code_1,code_out_2)
figure(2)

plot(pam_out_1)

% figure(1)
% subplot(1,2,1)
% plot(pam)
% title('PAM')
% subplot(1,2,2)
% plot(pam_out_1)
% title('PAM OUT')
% 
% figure(2)
% subplot(1,2,1)
% plot(lowpass_t(1:400))
% title('sinc')
% subplot(1,2,2)
% plot(match_out_1_org)
% title('match out 1 org')
% 
% figure(3)
% subplot(1,2,1)
% plot(match_out_1_org)
% title('match out 1 org')
% subplot(1,2,2)
% plot(match_out_1)
% title('match out 1')



