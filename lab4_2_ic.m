data = dlmread("/home/loserleo//mnt/nas_share/Lab_data/lab4_2_ic.csv")
x= data(:,1)
y= data(:,2)
ic = (x-y)/1000
vb = 0.629-1000*25*10^-6

rpi = vb/(25*10^-6)


r0 = 2.5./ic
r0_mean = mean(r0)


gm = vb./y
gm_mean = mean(gm)


%2.8    0.629

plot(gm)

r0 = 2.5./ic

rpi = vb/(25*10^-6)