function histo=vlgs(res)
res=res(:,:,1);
p=double(res);
[m,n]=size(res);
histo=zeros(1,256);
for i=1:m-3
    for j=1:n-2
        %VLGS
        b(1)=p(i+1,j+1)>=p(i,j+2); b(2)=p(i,j+2)>=p(i,j);
        b(3)=p(i,j)>=p(i+1,j+1); b(4)=p(i+1,j+1)>=p(i+2,j+1);
        b(5)=p(i+2,j+1)>=p(i+3,j+2); b(6)=p(i+3,j+2)>=p(i+3,j);
        b(7)=p(i+3,j)>=p(i+2,j+1); b(8)=p(i+2,j+1)>=p(i+1,j+1);
        vlgs(i,j)=0;
        for ii=1:8
            vlgs(i,j)=vlgs(i,j)+b(ii)*2^(8-ii);
        end
    end
end
histo=imhist(uint8(vlgs));