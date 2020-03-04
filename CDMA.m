% t1 = 0:0.001:1;
% f1 = @(x)(x<=0.25|x>0.75).*1 + (x>0.25 & x<=0.75).*(-1);
% f2 = @(x)(x<0.5).*1 + (x>=0.5).*(-1);
% m1 = f1(t1);
% m2 = f2(t1);
% N = length(m1);
% subplot(3,2,1)
% plot(t1,m1)
% title('m1码，表示0')
% subplot(3,2,2)
% plot(t1,m2);
% title('m2码，表示1')
% 
% for i=1:2*N
%     if i<N+1
%         user1(i) = m1(i);
%     else
%         user1(i) = m1(i-N);
%     end
% end
% subplot(3,2,3)
% plot(user1)
% title('用户1的地址码，00');
% 
% for i=1:2*N
%     if i<N+1
%         user2(i) = m1(i);
%     else
%         user2(i) = m2(i-N);
%     end
% end
% subplot(3,2,4)
% plot(user2)
% title('用户2的地址码，01');
msg_1 = randi([0,1],20);
msg_2 = randi([0,1],20);
user1_pn_1 = [1 1 1 1];
user1_pn_0 = [-1 -1 -1 -1];
user2_pn_1 = [1 1 -1 -1];
user2_pn_0 = [-1 -1 1 1];
code_1 = [];
code_2 = [];
for i = 1:length(msg_1)
    if(msg_1(i)) == 0 
        code_1 = [code_1 user1_pn_0];
    else
        code_1 = [code_1 user1_pn_1];
    end
end
for i = 1:length(msg_2)
    if(msg_2(i)) == 0
        code_2 = [code_2 user2_pn_0];
    else
        code_2 = [code_2 user2_pn_1];
    end
end
subplot(3,2,1);stem(msg_1(1:20));title('用户1发送信息序列')
subplot(3,2,2);stem(msg_2(1:20));title('用户2发送信息序列')
subplot(3,2,3);stem(code_1);title('信息1扩频后')
subplot(3,2,4);stem(code_2);title('信息2扩频后')

% %调制
% fc = 50;fs = 200;
% send_1 = ssbmod(code_1,fc,fs);
% receive_1 = awgn(send_1,0);
% send_2 = ssbmod(code_2,fc,fs);
% receive_2 = awgn(send_2,0);
% ret_code_1 = ssbdemod(receive_1,fc,fs);
% ret_code_2 = ssbdemod(receive_2,fc,fs);

%解扩
receive = code_1+code_2;
ret_msg_1 = [];
ret_msg_2 = [];
for i = 1:length(receive)/4
    temp1 = receive((i-1)*4+1:i*4).*user1_pn_1;
    temp2 = receive((i-1)*4+1:i*4).*user2_pn_1;
    if sum(temp1)>0
        ret_msg_1 = [ret_msg_1 1];
    else
        ret_msg_1 = [ret_msg_1 0];
    end
    if sum(temp2)>0
        ret_msg_2 = [ret_msg_2 1];
    else
        ret_msg_2 = [ret_msg_2 0];
    end
end

subplot(3,2,5);stem(ret_msg_1);title('解扩后信息1序列')
subplot(3,2,6);stem(ret_msg_2);title('解扩后信息2序列')

