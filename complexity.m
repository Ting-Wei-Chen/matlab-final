clear
for i=1:1:8
    while true
        A=rand(2^i);
        if abs(det(A))<0.1
            continue
        else
            break
        end
    end
    b=rand(2^i,1);
    
    starttime=tic;
    A\b;
    telapse=toc(starttime);
    bulit_in_solvetime(i)=telapse;
    
    starttime=tic;
    sblu(A,b);
    telapse=toc(starttime);
    lu_solvetime(i)=telapse;
    
    starttime=tic;
    sbge(A,b);
    telapse=toc(starttime);
    ge_solvetime(i)=telapse;
end

x=1:1:8;
x=2.^x;
plot(x,bulit_in_solvetime,'r')
hold on
plot(x,lu_solvetime,'g')
hold on
plot(x,ge_solvetime,'b')

lognum=log(x);
logbulit_in=log(bulit_in_solvetime);
loglu=log(lu_solvetime);
logge=log(ge_solvetime);

bulit_in=polyfit(lognum,logbulit_in,1);
lu=polyfit(lognum,loglu,1);
ge=polyfit(lognum,logge,1);

fprintf('complexity:\n');
fprintf('bulit in function:%d\n',bulit_in(1));
fprintf('lu decomposition:%d\n',lu(1));
fprintf('gussain elimination:%d\n',ge(1));