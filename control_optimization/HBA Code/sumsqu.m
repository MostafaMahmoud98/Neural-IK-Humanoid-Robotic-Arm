function [y] = sumsqu(xx)
d = length(xx);
total = 0;
for ii = 1:d
	xi = xx(ii);
	total = total + ii*xi^2;
end

y = total;

end
