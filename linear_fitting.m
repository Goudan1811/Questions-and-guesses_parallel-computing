%lg(0.025)=-1.602
w=[9,9.698,10,10.698,11,11.698,12,12.698,13,13.698];
n=[3.913,3.612,3.612,3.311,3.010,3.010,3.010,2.709,2.408,2.408];

p=polyfit(w,n,1);
w2=9:0.01:14;
n2=polyval(p,w2);
%p=[-0.3269,6.8108]
plot(w,n,'x',w2,n2,'r')

title('linear fitting lg\omega-lgN')
xlabel('lg\omega')
ylabel('lgN')
legend('','lgN= -0.33lg\omega+6.81')