function [first,last] = extract_util(I_bin)
first=find(I_bin==0,1,'first');
last=find(I_bin==0,1,'last');

end

