function histo=lelgs(res)
res=res(:,:,1);
p=double(res);
[m,n]=size(res);
lelgs1=zeros(m,n);
lelgs2=zeros(m,n);
for i=1:m-2
    for j=1:n-3
        b(1)=p(i+1,j+1)>=p(i,j); b(2)=p(i,j)>=p(i+2,j);
        b(3)=p(i+2,j)>=p(i+1,j+1); b(4)=p(i+1,j+1)>=p(i+1,j+2);
        b(5)=p(i+1,j+2)>=p(i,j+3); b(6)=p(i,j+3)>=p(i+2,j+3);
        b(7)=p(i+2,j+3)>=p(i+1,j+2); b(8)=p(i+1,j+2)>=p(i+1,j+1);
        lelgs1(i,j)=0;
        for ii=1:8
            lelgs1(i,j)=lelgs1(i,j)+b(ii)*2^(8-ii);
        end
    end
end
% LE -LGS2
for i=1:m-3
    for j=1:n-2
        b(1)=p(i+1,j+1)>=p(i,j+2); b(2)=p(i,j+2)>=p(i,j);
        b(3)=p(i,j)>=p(i+1,j+1); b(4)=p(i+1,j+1)>=p(i+2,j+1);
        b(5)=p(i+2,j+1)>=p(i+3,j+2); b(6)=p(i+3,j+2)>=p(i+3,j);
        b(7)=p(i+3,j)>=p(i+3,j+1); b(8)=p(i+2,j+1)>=p(i+1,j+1);
        lelgs2(i,j)=0;
        for ii=1:8
            lelgs2(i,j)=lelgs2(i,j)+b(ii)*2^(8-ii);
        end
    end
end
lelgs=bitor(lelgs1,lelgs2);
histo=imhist(uint8(lelgs));