function histo=slgs(res)
res=res(:,:,1);
[m,n]=size(res);
p=double(res);
histo=zeros(1,256);
for i=1:m-2
    for j=1:n-4
        b(1)=p(i+1,j+2)>=p(i+1,j+1); b(2)=p(i+1,j+1)>=p(i,j);
        b(3)=p(i,j)>=p(i+2,j); b(4)=p(i+2,j)>=p(i+1,j+1);
        b(5)=p(i+1,j+1)>=p(i+1,j+3); b(6)=p(i+1,j+3)>=p(i,j+4);
        b(7)=p(i,j+4)>=p(i+2,j+4); b(8)=p(i+2,j+4)>=p(i+1,j+3);
        slgs(i,j)=0;
        for ii=1:8
           slgs(i,j)=slgs(i,j)+b(ii)*2^(8-ii);
        end
    end
end
histo=imhist(uint8(slgs));