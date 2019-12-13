data = dlmread("/home/loserleo//mnt/nas_share/Lab_data/lab4_1.csv")
x= data(:,1)
y= data(:,2)
z = (x-y)/1000

y5 = [50*10^-6 50*10^-6]
x5 = [0 3]
y2 = [25*10^-6 25*10^-6]
x2 = [0 3]
plot(x,z,"r")
hold on
xlim([0 2])
plot(x5,y5,"b")
plot(x2,y2,"b")
xlabel("Vbe(V)")
ylabel("Ib(A)")
ginput(2)
