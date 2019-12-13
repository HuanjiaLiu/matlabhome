data = dlmread("/home/loserleo//mnt/nas_share/Lab_data/lab4_2.csv")
data1 = dlmread("/home/loserleo//mnt/nas_share/Lab_data/lab4_50.csv")
x= data(:,2)
y= data(:,3)
x1= data1(:,2)
y1= data1(:,3)

z = ((x-y)/1000)/(25*10^-6)
z1= ((x1-y1)/1000)/(50*10^-6)
plot(x,z,"r")
hold on
plot(x1,z1,"g")


xlim([0 5])
xlabel("Vce(V)")
ylabel("\beta")
legend('Vce vs \beta at Ib = 25uA','Vce vs \beta at Ib = 50uA');
hold off