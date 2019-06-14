p1 =[0 0 100]
p2 = [100 0 0]
p3 = [60 0 80]
p0 = [0 0 0]

t=0:0.01:pi/2
x = 100*sin(t)
y = 100*cos(t)
z = zeros(numel(x),1)
plot3(x,z,y,"b")
grid on 
hold on 

height = 0:1:100
length = 100^2-height.^2
length_y = sqrt(100^2-length./4)
length_x = sqrt(length./4)
final_point = []
plot3([0 0],[0,0],[100,0],"g")
for i=1:(numel(length))
    line1 = cat(1,[length_x(i) length_y(i) height(i)],[0 0 height(i)])
    line2 = cat(1,[length_x(i) length_y(i) height(i)],[length_x(i).*2 0 height(i)])
    plot3(line1(:,1),line1(:,2),line1(:,3),"r")

    plot3(line2(:,1),line2(:,2),line2(:,3),"y")
    pause(.05)
   

end
hold off
