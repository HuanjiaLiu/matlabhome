n = [1 0 1]
zero = [0 0 0]
rotatething = [1 0 0]

line_origin = cat(1,n,zero)
line_origin1 = cat(1,rotatething,zero)

plot3(line_origin(:,1),line_origin(:,2),line_origin(:,3),"b") 
hold on
plot3(line_origin1(:,1),line_origin1(:,2),line_origin1(:,3),"r") 
grid on
hold on
theta_sum = 0:0.1:pi()

for i = 1:(numel(theta_sum))
    theta = theta_sum(i)
    rotatex = [(n(1)^2)*(1-cos(theta))+cos(theta) n(1)*n(2)*(1-cos(theta))+n(3)*sin(theta) n(1)*n(3)*(1-cos(theta))-n(2)*sin(theta)]
    rotatey = [n(1)*n(2)*(1-cos(theta))-n(2)*sin(theta) n(2)*n(2)*(1-cos(theta))+cos(theta) n(2)*n(3)*(1-cos(theta))+n(1)*sin(theta)]
    rotatez = [n(1)*n(3)*(1-cos(theta))+n(3)*sin(theta) n(2)*n(3)*(1-cos(theta))-n(1)*sin(theta) n(3)*n(3)*(1-cos(theta))+cos(theta)]

    rotate = [rotatex;rotatey;rotatez]
    
    final_matrix = rotatething*rotate
    final_matrix = final_matrix/sqrt(sum(final_matrix.^2))
    final_line = cat(1,final_matrix, zero)
    plot3(final_line(:,1),final_line(:,2),final_line(:,3),"g") 
    hold on
    pause(.01)
end
hold off


