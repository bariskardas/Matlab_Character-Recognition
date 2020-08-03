
function[mahalanobisdistance]=mahaDistance2(X,Y)   %mahalanobis yöntemini kullanan fonk.
S = cov(X);
mu = mean(X,1);
d = (Y-mu)*inv(S)*(Y-mu)';
mahalanobisdistance=d;
end