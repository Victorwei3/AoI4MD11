clear all;
clc
I = 4;
D = 1;
W1 = I - D;
cnt1 = 0;
cnt2 = 0;
s = 1;
avg1 = 0; avg2 = 0;
lamdba = 5;
W2 = 1/lamdba;
rt1 = W1;
rt2 = D;
for ind=1:1*10^7
    a = exprnd(1/lamdba);        
    if s == 1
        cnt1 = cnt1 + 1;
        if a <= rt1
            rt1 = rt1 - a;
            s = 1;
            avg1 = avg1 + a * (rt1+W2+D);
        elseif a > rt1
            s = 2;
            avg1 = avg1 + a * D;
        end
    elseif s == 2
        cnt2 = cnt2 + 1;
        if a <= rt2
            rt2 = rt2 - a;
            s = 2;
            avg2 = avg2 + a * (rt2 + W1 + W2 + D);
        elseif a > rt2 && a <= W1 + rt2
            s = 1;
            rt1 = W1 - (a - rt2);
            avg2 = avg2 + a * (D + W2 + W1 - (a - rt2));
        elseif a > W1 + rt2
            s = 2;
            avg2 = avg2 + a * D;
        end
    end
        
       
end
p1=cnt1/(1*10^7);p2=cnt2/(1*10^7);
avg=(avg1+avg2)/(1*10^7);

aoi=avg*lamdba+1/lamdba;