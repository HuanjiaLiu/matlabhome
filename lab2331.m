

[x,y]=draw_picture('/home/loserleo/matlab_h/1_8new.csv',1)
final_y = medfilt1(y,12)
plot(x,final_y,"r")


hold on
[x1,y1]=draw_picture('/home/loserleo/matlab_h/1_7new.csv',1)
final_y1 = medfilt1(y1,10)
plot(x1,final_y1,"G")


[x2,y2]=draw_picture('/home/loserleo/matlab_h/1_6new.csv',1)
final_y2 = medfilt1(y2,10)
plot(x2,final_y2,"B")


data = dlmread("/home/loserleo/matlab_h/vgs.csv")
temp_x = data(:,1) 
temp_y = data(:,2) 
[start,final] = vgs_range(temp_x,temp_y)
final_x = x_aix_move(temp_x(start:final),2)
plot(final_x-1.5,temp_y(start:final)/1000,"K")

xlim([-0.1 1])

ylim([-0.1/1000 0.8/1000])


xlabel("Vds(V")
ylabel("Id(A)")
legend('VDS at VGS = 1.8V','VDS at VGS = 1.7V','VDS at VGS = 1.6V',"VGS-VT");
hold off

%{
data = dlmread("/home/loserleo/matlab_h/vgs.csv")
temp_x = data(:,1) 
temp_y = data(:,2) 
[start,final] = vgs_range(temp_x,temp_y)
final_x = x_aix_move(temp_x(start:final),2)
plot(final_x,temp_y(start:final),"r")
xlabel("Vgs(V)")
ylabel("Id(A)")
%}


function [x,y] = draw_picture(direction,range)
    data = dlmread(direction)
    temp_x = data(:,1) 
    temp_y = data(:,2) 
    [start,final] = get_range(temp_x,temp_y)
    final_x = x_aix_move(temp_x(start:final),range)
    x = final_x
    y = temp_y(start:final)/1000
end



function [start,final] = get_range(x,y)
    for i = 1:length(x)-1
        if y(i)<y(i+1) && y(i)<0.001
            start = i
            for j = i:length(x)-1
                if y(j)>y(j+1) && y(j)<0.001
                    final = fix((j+i)/2)                        
                    
                    break
                end
            
            end
        break
        end    
    end
end

function final_x = x_aix_move(x,range)
    final_x = (x-x(1))*(range/(-x(1)+x(length(x))))
end




function [start,final] = vgs_range(x,y)
    for i = 1:length(x)-1
        if y(i)>y(i+1)&& y(i)>1.7
            
            for j = i+500:length(x)-1
                if y(j)>y(j+1) && y(j)>1.7
                    start = fix((i+j)/2)
                    final = j
                    break
                end
            end
            break
        end
    end
end