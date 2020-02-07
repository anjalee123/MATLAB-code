clear all; close all;
clc;
thetamax=pi/50;

   
%5
    %a=input('Enter slit width (in micro meter): ');
    a=200*1e-6;
    %d=input('Enter slit seperation (in mm): ');
    d=0.25*1e-3;
    %l=input('Enter wavelength (in nm): ');
    l=532*1e-9;
    s=1.3;%=input('Enter slit to screen distance (in m): ');
    theta=-thetamax:1e-5:thetamax;
    y=s*tan(theta);
    alpha=pi*a*sin(theta)/l;
    beta=pi*d*sin(theta)/l;
    x1=cos(beta).^2;            % Interference term
    x2=(sin(alpha)./alpha).^2;  % Diffraction term
    x=x1.*x2;  % Combined effect
    %subplot(2,1,1), 
    plot(y,x,'b',y,x2,'--r');
    %title('Double slit interference pattern');
    xlabel('Distance in m');
    ylabel('Intensity');
    hold all;
    %ch= input('Press 1 to continue and 0 to exit: ');
%if ch == 0
%    break;
% end


X=importdata('T14.csv');
%%subplot(2,1,2),
dist = X(:,1);
intensity = X(:,2);
[m,indx] = max(intensity);

shift = dist(indx)/1.03;

plot(dist-shift,intensity./max(intensity),'o');
xlim([-.02,.02]),


