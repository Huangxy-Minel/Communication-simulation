
st=mstg;   %�����źŲ�������mstg��������·�����ز������ź���ӹ��ɵĸ����ź�s
Fs=5000; T=1/Fs;  %����Ƶ��
 fp=280; fs=450;wp=2*fp/Fs;ws=2*fs/Fs; %��ͨ
    wp = tan(wp/2);ws = tan(ws/2);
    name='y_1(t)';LHL_filter(wp,ws,name,st,T,'low');
 fp_L=440; fp_R=560;fs_L=275; fs_R=900;%��ͨ
     wp=[tan(fp_L/Fs),tan(fp_R/Fs)];ws=[tan(fs_L/Fs),tan(fs_R/Fs)];
     name='y_2(t)'; LHL_filter(wp,ws,name,st,T,'bandpass');
 fp=890; fs=600;wp=2*fp/Fs;ws=2*fs/Fs; %��ͨ
    wp = tan(wp/2);ws = tan(ws/2);
    name='y_3(t)';LHL_filter(wp,ws,name,st,T,'high');
