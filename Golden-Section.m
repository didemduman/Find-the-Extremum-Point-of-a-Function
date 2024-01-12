clc;
clear;
close all;

xlow=input('Enter Low value of x=');
xup=input('Enter up value of x=');
xfinal=10^-10;
x = 0:0.01:3; 
g=@myfunction;
gd=@derivativefunction;
T=0.38197; %Golden Section
e=xfinal/(xup-xlow); %Tolerance
N=-2.078*log(e); %Iteration Number
k=1; %Iteration Index
x1=(1-T)*xlow+T*xup;
x2=T*xlow+(1-T)*xup;
g1=g(x1);
g2=g(x2);   
i=1:fix(N);
h=(x-1).^2.*(x-2).*(x-3);
hd=4.*x.^3-21.*x.^2+34.*x-17;
while k<N
    if g1>g2
        
        xlow=x1;
        x1=x2;
        g1=g2;
        x2=T*xlow+(1-T)*xup;
        i(k)=x2;
        g2=g(x2);
        k=k+1;
        
    else 
        
        xup=x2;
        x2=x1;
        g2=g1;
        x1=(1-T)*xlow+T*xup;
        i(k)=x1;
        g1=g(x1);
        k=k+1;
    end
    
    
    figure(1); plot(x1,g1,'*r')
    hold on
   
end
    kk=1:k-1;
    xx=x1;
    fprintf('Root of equation is %f',x1)
    

figure(1);plot(x,h,'r')
hold on
grid on
figure(1);plot(x,hd,'k')
legend('Function','Derivative of Function')
xlabel('x')
    

figure(2)
subplot(2,1,1)
plot(kk,i)
title('Graph of x1 versus iteration')
xlabel('Iteration')
ylabel('x1')
legend('x1')
subplot(2,1,2)
plot(kk,derivativefunction(i))
title('Graph of f(x1) versus iteration')
xlabel('Iteration')
ylabel('f(x1)')
legend('\delta f(x1)')







    
    
    
