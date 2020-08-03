
function[mahalanobisdistance]=mahaDistance2(X,Y)   %mahalanobis y�ntemini kullanan fonk.
S = cov(X);
mu = mean(X,1);
d = (Y-mu)*inv(S)*(Y-mu)';
mahalanobisdistance=d;
end