
xPart1 = 0:10;
binomialDistributionPartA1 = binopdf(xPart1,10,0.1);% binomial distribution where n = 10, p = 0.1
poissonDistributionPartA1 = poisspdf(xPart1,1); % poisson distribution
binomialDistributionPartC1 = bpdf(xPart1,10,0.1); % binomial distribution where n = 10 and p = 0.1
poissonDistributionPartC1 = ppdf(xPart1,1); % poisson distribution
figure()
subplot(2,2,1);
plot(xPart1,binomialDistributionPartA1)
title('PDF of binomial for n = 10, p = 0.1')
xlabel('k')
ylabel('probability')
subplot(2,2,2);
plot(xPart1,poissonDistributionPartA1)
title('PDF of poisson for lambda[np] = 1')
xlabel('k')
ylabel('probability')
subplot(2,2,3);
plot(xPart1,binomialDistributionPartC1)
title('PDF of binomial for n = 10, p = 0.1')
xlabel('k')
ylabel('probability')
subplot(2,2,4);
plot(xPart1,poissonDistributionPartC1)
title('PDF of poisson for lambda[np] = 1')
xlabel('k')
ylabel('probability')
%--------------------------------------------------------
xPart2 = 0:20;
binomialDistributionPartA2 = binopdf(xPart2,20,0.05);% binomial distribution where n = 20 and p = 0.05
poissonDistributionPartA2 = poisspdf(xPart2,1);% poisson distribution
binomialDistributionPartC2 = bpdf(xPart2,20,0.05); % binomial distribution where n = 20 and p = 0.05
poissonDistributionPartC2 = ppdf(xPart2,1); % poisson distribution
figure()
subplot(2,2,1);
plot(xPart2,binomialDistributionPartA2)
title('PDF of binomial for n = 20 and p = 0.05')
xlabel('k')
ylabel('probability')
subplot(2,2,2);
plot(xPart2,poissonDistributionPartA2)
title('PDF of poisson for lambda[np] = 1')
xlabel('k')
ylabel('probability')
subplot(2,2,3);
plot(xPart2,binomialDistributionPartC2)
title('PDF of binomial for n = 20 and p = 0.05')
xlabel('k')
ylabel('probability')
subplot(2,2,4);
plot(xPart2,poissonDistributionPartC2)
title('PDF of poisson for lambda[np] = 1')
xlabel('k')
ylabel('probability')
%--------------------------------------------------------
xPart3 = 0:100;
binomialDistributionPartA3 = binopdf(xPart3,100,0.01); % binomial distribution where n = 100 and p = 0.01
poissonDistributionPartA3 = poisspdf(xPart3,1);% poisson distribution
binomialDistributionPartC3 = bpdf(xPart3,100,0.01);
poissonDistributionPartC3 = ppdf(xPart3,1);% poisson distribution
figure()
subplot(2,2,1);
plot(xPart3,binomialDistributionPartA3)
title('PDF of binomial for n = 100 and p = 0.01')
xlabel('k')
ylabel('probability')
subplot(2,2,2);
plot(xPart3,poissonDistributionPartA3)
title('PDF of poisson for lambda[np] = 1')
xlabel('k')
ylabel('probability')
subplot(2,2,3);
plot(xPart3,binomialDistributionPartC3)
title('PDF of binomial for n = 100 and p = 0.01')
xlabel('k')
ylabel('probability')
subplot(2,2,4);
plot(xPart3,poissonDistributionPartC3)
title('PDF of poisson for lambda[np] = 1')
xlabel('k')
ylabel('probability')
%----------------------------------------------------------
sum_b = sum(poissonDistributionPartC2);
sum_p = sum(poissonDistributionPartC2);
display(sum_b,'Sum of probabilities of binomial Distribution')
display(sum_p,'Sum of probabilities of poisson Distribution')
%--------------------------------------------------------
xVerify = 0:10000;
binomialDistributionPart22 = bpdf(xVerify,10000,.0001);
poissonDistributionPart22 = ppdf(xVerify,1);
figure()
subplot(2,1,1);
digits(25)
vpa(binomialDistributionPart22)
% binomialDistributionPart22(isnan(binomialDistributionPart22))=0;
plot(xVerify,binomialDistributionPart22)
title('PDF of binomial for n = 100, p = 0.01')
xlabel('k')
ylabel('probability')
subplot(2,1,2);
plot(xVerify,poissonDistributionPart22)
title('PDF of poisson for lambda[np] = 1')
xlabel('k')
ylabel('probability')
verify_b = sum(binomialDistributionPart22);
verify_p = sum(poissonDistributionPart22);
display(verify_b,'Sum of probabilities of binomial Distribution')
display(verify_p,'Sum of probabilities of poisson Distribution')
%----------------------------------------------------------
function [D] = ppdf(a,b)
E = length(a);
D = zeros(1,E);
    for i = 1:E
        if isnan(exp(-b)*b^a(i)/factorial(a(i)))
            D(i) = 0;
        else
            D(i) = exp(-b)*b^a(i)/factorial(a(i));
        end
    end
end

function [D] = bpdf(a,b,c)
E = length(a);
D = zeros(1,E);
    for i = 1:E
        k = a(i);
        if isnan((factorial(b)/(factorial(k)*factorial(b-k)))*(c^k)*(1-c)^(b-k))
            D(i) = 0;
        else
            D(i) = vpa(factorial(b)/(factorial(k)*factorial(b-k)))*(c^k)*(1-c)^(b-k));
        end
    end
end


