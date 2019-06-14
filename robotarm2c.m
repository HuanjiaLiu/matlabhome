p1 = [100 0 100]
p2 = [-100 100 0]
p0 = [0 0 0]

line_origin = cat(1,p1,p2)

plot3(line_origin(:,1),line_origin(:,2),line_origin(:,3),"b")
hold on 
plot3([0 0],[0,0],[100,0],"g")
grid on 

height = 0:1:100
length = 0:2:200

for i = 1:(numel(length))
    
    %plot3(line_origin(:,1),line_origin(:,2),line_origin(:,3),"b")
    %hold on 
    %plot3([0 0],[0,0],[100,0],"g")
    %hold on
    
    
    final_point = [-100+length(i) 100-height(i) height(i)]
    origin_point = [0 0 height(i)]
    final_line = -final_point+origin_point
    
    %line_of = cat(1,final_point,origin_point)
    %plot3(line_of(:,1),line_of(:,2),line_of(:,3))
    
    cross_line = cross(final_line,origin_point)
    cross_line = cross_line/sqrt(sum(cross_line.^2))
    line_lenght = sqrt(100^2 - sum(final_line/2).^2)
    medium_point = (final_point+origin_point)/2 + cross_line*line_lenght
    
    line_m1 = cat(1,final_point,medium_point)
    line_m2 = cat(1,origin_point,medium_point)
    plot3(line_m1(:,1),line_m1(:,2),line_m1(:,3),"r")
    hold on
    plot3(line_m2(:,1),line_m2(:,2),line_m2(:,3),"y")
    %hold off

    pause(.05)
   
    
    
end
hold off