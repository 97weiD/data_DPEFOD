clear all
close all
clc

Ad=[0 1 0 1;
    1 0 1 0;
    0 1 0 1;
    1 0 1 0];
d=sum(Ad);
L=diag(d)-Ad;L_bar=kron(L,eye(5));


A_hat=rand(5);
b1_hat=rand(5,1);b2_hat=rand(5,1);b3_hat=rand(5,1);b4_hat=rand(5,1);
C_hat=0.25*eye(5);
theta_0=zeros(20,1);lambda_0=zeros(20,1);
rho=0.1;
alpha1=0.995;
alpha2=0.075;
theta_ast=0.25*inv(A_hat'*inv(C_hat)*A_hat+rho*eye(5))*A_hat'*inv(C_hat)*(b1_hat+b2_hat+b3_hat+b4_hat)
step_size=0.0005;T=50;

K_bar=kron(eye(4),A_hat'*inv(C_hat)*A_hat+rho*eye(5))+L_bar; 
B_bar=[A_hat'*inv(C_hat)*b1_hat;A_hat'*inv(C_hat)*b2_hat;A_hat'*inv(C_hat)*b3_hat;A_hat'*inv(C_hat)*b4_hat];

sim('test1',T)
figure
t=0:step_size:T;
plot(t,theta(:,1),'-r',t,theta1(:,1),'--g','linewidth',1.25);hold on
plot(t,theta_ast(1)*ones(size(t)),':k','linewidth',0.5)
xlabel('time(s)')
ylabel('\theta_{1}^{}')
set(gca,'Fontname','Times New Roman','fontsize',12);
grid on 
legend('\alpha_{0}^{}=1.000','\alpha_{1}^{}=0.995')

figure
t=0:step_size:T;
plot(t,theta(:,2),'-r',t,theta1(:,2),'--g','linewidth',1.25);hold on
plot(t,theta_ast(2)*ones(size(t)),':k','linewidth',0.5)
xlabel('time(s)')
ylabel('\theta_{2}^{}')
set(gca,'Fontname','Times New Roman','fontsize',12);
grid on 
legend('\alpha_{0}^{}=1.000','\alpha_{1}^{}=0.995')

figure
t=0:step_size:T;
plot(t,theta(:,1),'-r',t,theta2(:,1),'--g','linewidth',1.25);hold on
plot(t,theta_ast(1)*ones(size(t)),':k','linewidth',0.5)
xlabel('time(s)')
ylabel('\theta_{1}^{}')
set(gca,'Fontname','Times New Roman','fontsize',12);
grid on 
legend('\alpha_{0}^{}=1.000','\alpha_{2}^{}=1.075')

figure
t=0:step_size:T;
plot(t,theta(:,2),'-r',t,theta2(:,2),'--g','linewidth',1.25);hold on
plot(t,theta_ast(2)*ones(size(t)),':k','linewidth',0.5)
set(gca,'Fontname','Times New Roman','fontsize',12);
xlabel('time(s)')
ylabel('\theta_{2}^{}')
grid on 
legend('\alpha_{0}^{}=1.000','\alpha_{2}^{}=1.075')