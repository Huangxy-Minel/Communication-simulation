function res = mypam(data, fs, Ts)
   res = [];
   len = length(data);
   for i = 1:len
       if data(i) == 1
           for j = 1:Ts*fs
               res = [res 1];
           end
       else
           for j = 1:Ts*fs
               res = [res -1];
           end
       end
   end
end