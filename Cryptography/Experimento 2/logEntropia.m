function result = logEntropia(x)
ind = (x>0);
result = zeros(size(x));
result(ind) = log(x(ind));
result(~ind) = 0;
end