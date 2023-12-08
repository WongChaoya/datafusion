[FileName,PathName] = uigetfile('*.txt','please choose the txt file');
FileName = [PathName,FileName];
data = load(FileName);
var8 = var(data(1:1000,8));
var9 = var(data(1:1000,9));
var10 = var(data(1:1000,10));

fusion1 = data(:,9) + (var9^2/(var8^2+var9^2))*(data(:,8)-data(:,9));
fusion2 = data(:,10) + (var10^2/(var10^2+var9^2))*(data(:,9)-data(:,10));
fusion3 = data(:,10) + (var10^2/(var10^2+var8^2))*(data(:,8) -data(:,10));

varf1   = var(fusion1(1:1000));
varf2   = var(fusion2(1:1000));
varf3   = var(fusion3(1:1000));
figure(1);
plot(fusion1);
figure(2);
plot(fusion2);
figure(3);
plot(fusion3);

combine = (fusion1 + fusion2 + fusion3)/3;
varcom  = var(combine(1:1000));
figure(4);
plot(combine);

figure(5);
plot(combine - data(:,3));