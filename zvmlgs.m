function histo=zvmlgs(res)
res=res(:,:,1);
p=double(res);
[m,n]=size(res);
histo=zeros(1,256);
for i=1:m-2
    for j=1:n-2
        b(1)=p(i+1,j+1)>=p(i,j+1); b(2)=p(i,j+1)>=p(i,j);
        b(3)=p(i,j)>=p(i+1,j); b(4)=p(i+1,j)>=p(i+2,j);
        b(5)=p(i+1,j+1)>=p(i+2,j+1); b(6)=p(i+2,j+1)>=p(i+2,j+2);
        b(7)=p(i+2,j+2)>=p(i+1,j+2); b(8)=p(i+1,j+2)>=p(i,j+2);
        zvmlgs(i,j)=0;
        for ii=1:8
            zvmlgs(i,j)=zvmlgs(i,j)+b(ii)*2^(8-ii);
        end
    end
end
histo=imhist(uint8(zvmlgs));