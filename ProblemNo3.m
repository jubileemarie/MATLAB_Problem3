function [ output_args ] = ProblemNo3(inp)
%Function to find the best polynomial fit for a given input
SizeCheck=size(inp);
for i=1:10000000000
if SizeCheck(2)~=2
    inp=input('Please Enter a N x 2 Matrix! \n');
else
    break
end
end
if SizeCheck(1)<=11
beste=SizeCheck(1)-1;
else
    beste=10;
end
x=inp(:,1);
y=inp(:,2);
j=0;
i=1;
while i<=SizeCheck(1)-1
    if x(i+1)<x(i)
    tmpx = x(i);
    x(i) = x(i+1);
    x(i+1) = tmpx;
    tmpy = y(i);
    y(i) = y(i+1);
    y(i+1) = tmpy;
    end
    i=i+1;
    if i==SizeCheck(1)
        i=1;
        j=j+1;
    end
    if j==SizeCheck(1)
        break
    end
end
z=polyfit(x,y,beste);
zz=polyval(z,x);
zzz=polyval(z,x(1):.001:x(end));
e=y-zz;
en=norm(e);
Polynomial_Coefficient=z
plot(x,y,'-ms','markersize',7,'markerfacecolor','b') %data
xlabel('x data')
ylabel('y data')
title('Best Polynomial Fit')
grid
hold on
plot(x(1):.001:x(end),zzz,'--k') %dashed line
hold on
legend('Data','Best Polynomial Fit');
hold on  
end

