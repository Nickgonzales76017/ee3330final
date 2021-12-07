%%%
Wins = 0;
Losses = 0;
total = 0;

    N = 148;
    n = 0:N-1;
    x0 = [zeros(10,1); ones(8,1); zeros(130,1)];
    x0 = x0/norm(x0);
    x1 = [zeros(18,1); ones(8,1); zeros(122,1)];
    x1 = x1/norm(x1);
    x2 = [zeros(26,1); ones(8,1); zeros(114,1)];
    x2 = x2/norm(x2);
    x3 = [zeros(34,1); ones(8,1); zeros(106,1)];
    x3 = x3/norm(x3);
    x4 = [zeros(42,1); ones(8,1); zeros(98,1)];
    x4 = x4/norm(x4);
    x5 = [zeros(50,1); ones(8,1); zeros(90,1)];
    x5 = x5/norm(x5);
    x6 = [zeros(58,1); ones(8,1); zeros(82,1)];
    x6 = x6/norm(x6);
    x7 = [zeros(66,1); ones(8,1); zeros(74,1)];
    x7 = x7/norm(x7);
    x8 = [zeros(74,1); ones(8,1); zeros(66,1)];
    x8 = x8/norm(x8);
    x9 = [zeros(82,1); ones(8,1); zeros(58,1)];
    x9 = x9/norm(x9);
    x10 = [zeros(90,1); ones(8,1); zeros(50,1)];
    x10 = x10/norm(x10);
    x11 = [zeros(98,1); ones(8,1); zeros(42,1)];
    x11 = x11/norm(x11);
    x12 = [zeros(106,1); ones(8,1); zeros(34,1)];
    x12 = x12/norm(x12);
    x13 = [zeros(114,1); ones(8,1); zeros(26,1)];
    x13 = x13/norm(x13);
    x14 = [zeros(122,1); ones(8,1); zeros(18,1)];
    x14 = x14/norm(x14);
    x15 = [zeros(130,1); ones(8,1); zeros(10,1)];
    x15 = x15/norm(x15);
    % x16 = [zeros(144,1); zeros(9,1); zeros(121,1)];
    % x16 = x16/norm(x16);

    signals=[x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15];
    H = 1;
    for i1 = 1:1:15
        for i = 1:1:(16-H)
            if dot(signals(:,i1),signals(:,i+H)) == 0

                continue
            else 
                disp('error: signal not orthoginal')
                break
            end
        end
        H = H + 1;
    end

    subplot(5,4,1)
    stem(n,x0,'b','Marker','none','LineWidth',1)
    title('Signal x0  ','fontsize',18)
    subplot(5,4,2)
    stem(n,x1,'r','Marker','none','LineWidth',1)
    title('Signal x1','fontsize',18)
    subplot(5,4,3)
    stem(n,x2,'b','Marker','none','LineWidth',1)
    title('Signal x2  ','fontsize',18)
    subplot(5,4,4)
    stem(n,x3,'r','Marker','none','LineWidth',1)
    title('Signal x3','fontsize',18)
    subplot(5,4,5)
    stem(n,x4,'b','Marker','none','LineWidth',1)
    title('Signal x4  ','fontsize',18)
    subplot(5,4,6)
    stem(n,x5,'r','Marker','none','LineWidth',1)
    title('Signal x5','fontsize',18)
    subplot(5,4,7)
    stem(n,x6,'b','Marker','none','LineWidth',1)
    title('Signal x6 ','fontsize',18)
    subplot(5,4,8)
    stem(n,x7,'r','Marker','none','LineWidth',1)
    title('Signal x7 ','fontsize',18)
    subplot(5,4,9)
    stem(n,x8,'b','Marker','none','LineWidth',1)
    title('Signal x8 ','fontsize',18)
    subplot(5,4,10)
    stem(n,x9,'r','Marker','none','LineWidth',1)
    title('Signal x9 ','fontsize',18)
    subplot(5,4,11)
    stem(n,x10,'b','Marker','none','LineWidth',1)
    title('Signal x10  ','fontsize',18)
    subplot(5,4,12)
    stem(n,x11,'r','Marker','none','LineWidth',1)
    title('Signal x11 ','fontsize',18)
    subplot(5,4,13)
    stem(n,x12,'b','Marker','none','LineWidth',1)
    title('Signal x12 ','fontsize',18)
    subplot(5,4,14)
    stem(n,x13,'r','Marker','none','LineWidth',1)
    title('Signal x13 ','fontsize',18)
    subplot(5,4,15)
    stem(n,x14,'b','Marker','none','LineWidth',1)
    title('Signal x14 ','fontsize',18)
    subplot(5,4,16)
    stem(n,x15,'r','Marker','none','LineWidth',1)
    title('Signal x15','fontsize',18)
for PPP = 1:1:50
    NF = 0.17;
    % received signal is either x0 or x1 with additive noise
    % y = x10+ NF*randn(size(x1));
    y = signals(:,round(rand(1,1))+1) + NF*randn(size(x1)) ;
    y=y./norm(y); % normalize y


    subplot(5,4,[17,18,19,20])
    stem(n,y,'k','Marker','none','LineWidth',1)
    title('Received signal - Was it a 0 or 1?','fontsize',18)

    % computes the inner products between y and both x0 and x1:
    ip0 = abs( y' * x0 );
    ip1 = abs( y' * x1 );
    ip2 = abs( y' * x2 );
    ip3 = abs( y' * x3 );
    ip4 = abs( y' * x4 );
    ip5 = abs( y' * x5 );
    ip6 = abs( y' * x6 );
    ip7 = abs( y' * x7 );
    ip8 = abs( y' * x8 );
    ip9 = abs( y' * x9 );
    ip10 = abs( y' * x10 );
    ip11 = abs( y' * x11 );
    ip12 = abs( y' * x12 );
    ip13 = abs( y' * x13 );
    ip14 = abs( y' * x14 );
    ip15 = abs( y' * x15 );
    % ip16 = abs( y' * x16 );


    %%%%
    %%%% Write code below that stores a 0 or 1 into RECEIVEDBIT
    %%%% based upon whether x0 or x1 was the more likely transmission
    %%%% (hint: it should only take one or two lines of code)
    [rECEIVEDBIT]=([zeros(1,10),ip0,ip1,ip2,ip3,ip4,ip5,ip6,ip7,ip8,ip9,ip10,ip11,ip12,ip13,ip14,ip15]);
    [RECEIVEDBIT,loc]=findpeaks(rECEIVEDBIT,'SortStr', 'descend', 'NPeaks', 2);
    % disp(rECEIVEDBIT)
    ReCEIVEDBIT = RECEIVEDBIT(1)-RECEIVEDBIT(2);
    if ReCEIVEDBIT > 0.3
        fprintf('x%i\n',(loc(1)-11)) 
        disp('Confidence: high')
        Wins = Wins + 1;
    else
        fprintf('x%i\n',(loc(1)-1))  
        disp('Confidence: Low')
        Losses = Losses + 1;
    end
    total = total + 1;
    Ratio = (Wins/total)*100;
    
    % disp(RECEIVEDBIT)
    % disp(ReCEIVEDBIT)
    % disp(loc)
end
fprintf('The High confidence Ratio is :%f%%\n',Ratio)
