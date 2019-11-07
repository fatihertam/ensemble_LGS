function histo=vslgs(res)
res=res(:,:,1);
p=double(res);
[m,n]=size(res);
histo=zeros(1,256);
for i=1:m-4
    for j=1:n-2
        b(1)=p(i+2,j+1)>=p(i+1,j+1); b(2)=p(i+1,j+1)>=p(i,j+2);
        b(3)=p(i,j+2)>=p(i,j); b(4)=p(i,j)>=p(i+1,j+1);
        b(5)=p(i+2,j+1)>=p(i+3,j+1); b(6)=p(i+3,j+1)>=p(i+4,j+2);
        b(7)=p(i+4,j+2)>=p(i+4,j); b(8)=p(i+4,j)>=p(i+3,j+1);
        vslgs(i,j)=0;
        for ii=1:8
            vslgs(i,j)=vslgs(i,j)+b(ii)*2^(8-ii);
        end
    end
end
histo=imhist(uint8(vslgs));