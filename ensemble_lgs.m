clc,clear all,close all
dosya=dir('path/*.txt');
say=1;
for k=1:length(dosya)
    sinyal=textread(dosya(k).name);
    res=reshape(sinyal(1:4096),[64,64])';
    for i=1:4
        X(k,(i-1)*2048+1:i*2048)=[lelgs(res)' slgs(res)' vlgs(res)' vslgs(res)' ...
            zhlgs(res)' zhmlgs(res)' zvlgs(res)' zvmlgs(res)'];
        [ll,lh,hl,hh]=dwt2(res,'sym2');
        clear res
        res=ll;
        clear ll;
    end
    y(k)=say;
    if mod(k,100)==0
        say=say+1;
    end
end
[m,n]=size(X);
for i=1:n
    X(:,i)=(X(:,i)-min(X(:,i)))/(max(X(:,i))-min(X(:,i))+eps);
end
[a,b]=relieff(X,y',10);
ss=1;
for i=1:length(a)
    if b(i)>0
        poz(:,ss)=X(:,i);
        ss=ss+1;
    end
end
mdl = fscnca(poz,y,'Solver','sgd','Verbose',1);
w=mdl.FeatureWeights;
[aa,ind]=sort(w,'desc');
tt=1000;
for i=1:tt
    cd(:,i)=poz(:,ind(i));
end
cd(:,tt+1)=y;

