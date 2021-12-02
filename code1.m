close all
clear
clc

% bg=imread('back1.jpg');% read background image

x0=[100 300 500 700];
y0=[850 850 850 850];% position of text
s0=[80 80 80 80];% size of text
r0=[0 0 0 0]; % rotation of text
txt=['中秋团圆'];

x_max=x0+10;
x_min=x0-10; 
y_max=y0+10;
y_min=y0-10; % max and min position
s_max=s0+20;
s_min=s0-20; % max and min size
r_max=r0+20;
r_min=r0-20; % max and min rotation
cr_max=ones(1,4);
cg_max=ones(1,4);
cb_max=ones(1,4); % max of rgb
cr_min=[0.5 0.5 0.5 0.5];
cg_min=[0.5 0.5 0.5 0.5];
cb_min=zeros(1,4); % min of rgb

x=rand(1,4);
y=rand(1,4);
s=rand(1,4);
r=rand(1,4);
cr=rand(1,4);
cg=rand(1,4);
cb=rand(1,4); % initial rand number

while(1) % loop, never stop
    x=x+0.2*rand(1,4)-0.1;
    y=y+0.2*rand(1,4)-0.1;
    s=s+0.2*rand(1,4)-0.1;
    r=r+0.2*rand(1,4)-0.1;
    cr=cr+0.2*rand(1,4)-0.1;
    cg=cg+0.2*rand(1,4)-0.1;
    cb=cb+0.2*rand(1,4)-0.1; %generate rand number
    
    % equation:
    % number = min_number + rand_number * (max_number - min_number)
    % where rand_number is 0~1 and it changes smoothly
    
    x(x>1)=1;
    x(x<0)=0;
    y(y>1)=1;
    y(y<0)=0;
    s(s>1)=1;
    s(s<0)=0;
    r(r>1)=1;
    r(r<0)=0;
    cr(cr>1)=1;
    cr(cr<0)=0;
    cg(cg>1)=1;
    cg(cg<0)=0;
    cb(cb>1)=1;
    cb(cb<0)=0; % limit rand_number in 0~1
    

    cla(gcf)
    imshow(bg) % main function 1 imshow
    hold on

    for i=1:4;
    text(x_min(i)+x(i)*(x_max(i)-x_min(i)),...
        y_min(i)+y(i)*(y_max(i)-y_min(i)),...
        txt(i),...
        'FontSize',s_min(i)+s(i)*(s_max(i)-s_min(i)),...
        'Rotation',r_min(i)+r(i)*(r_max(i)-r_min(i)),...
        'Color',[cr_min(i)+cr(i)*(cr_max(i)-cr_min(i)),...
        cg_min(i)+cg(i)*(cg_max(i)-cg_min(i)),...
        cb_min(i)+cb(i)*(cb_max(i)-cb_min(i))],...
        'FontName','黑体')
    end % main function 2 text
    
    xs=randi(1000,1,50);
    ys=randi(1000,1,50);
    plot(xs,ys,'LineStyle','none','Marker','x','MarkerSize',10,'MarkerEdgeColor',[1 1 rand]) % main function 3 plot
    
    pause(0.01)
    
end


