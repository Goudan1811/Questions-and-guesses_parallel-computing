
close all;

M_Omega=[10^9,5*10^9,10^10,5*10^10,10^11,5*10^11,10^12,5*10^12,10^13,5*10^13];
%频率成分


M_N=[16,32,64,128,256,512,1024,2048,4096,8192];
% array N X N size

size=10;
%矩阵尺寸

m_deviation = zeros(size,size);



for m = 1:size
    for n = 1:size
        Omega=M_Omega(m);
        N=M_N(n);
        m_deviation(m,n) = log10(deviation(Omega,N));
    end
end

h=heatmap(m_deviation);
h.Title="\omega-N-lg(deviation)";
h.XLabel="\omega";
h.YLabel="N";
h.XData={"1GHz","5GHz","10GHz","50GHz","100GHz","500GHz","1THz","5THz","10THz","50THz"};
h.YData={"16","32","64","128","256","512","1024","2048","4096","8192"};
h.CellLabelFormat = '%0.3f'

    






function [deviation] = deviation(omega, N)
c = 3e8;
%电磁波波速
d = 200e-9;
%crossbar间距
delta_t = d/c;
%delta_t

R = round((rand(N, N))*36000) + 4000;
V_input = rand(1, N)*20;
i_ideal = zeros(N, N);
i_real = zeros(N, N);
I_ideal = zeros(1,N);
I_real = zeros(1,N);
I_deviation = zeros(1,N);
for p=1:N
    for q=p:N
        i_ideal(p,q) = 1;
        i_real(p,q) = exp(-1i*omega*(p+q)*delta_t)*1;
        I_ideal(1,q) = I_ideal(1,q) + i_ideal(p,q);
        I_real(1,q) = I_real(1,q) + i_real(p,q);
    end
end
for i=1:N
    I_deviation(1,i) = abs(I_ideal(1,q)-abs(I_real(1,q)))/I_ideal(1,q);
end
deviation = mean(I_deviation);

end


