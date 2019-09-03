function [R, G, B]=hsvToRGB(H, S, V)

[row,col]=size(H);
% H=img_in(:,:,1);
% S=img_in(:,:,2);
% V=img_in(:,:,3);
   
for i=1 : row
    for j=1 : col
       if S(i,j) == 0
           R(i,j) = V(i,j) * 255;
           G(i,j) = V(i,j) * 255;
           B(i,j) = V(i,j) * 255;
       else
            var_h(i,j) = H(i,j) * 6;
            if var_h(i,j) == 6
                var_h(i,j) = 0;
            end
            var_i(i,j) = uint8(var_h(i,j));
            var_1(i,j) = V(i,j) * ( 1 - S(i,j) );
            var_2(i,j) = V(i,j) * ( 1 - S(i,j) * ( var_h(i,j) - var_i(i,j) ) );
            var_3(i,j) = V(i,j) * ( 1 - S(i,j) * ( 1 - ( var_h(i,j) - var_i(i,j) ) ) );
            
            if var_i(i,j) == 0
                var_r(i,j) = V(i,j); 
                var_g(i,j) = var_3(i,j); 
                var_b(i,j) = var_1(i,j);
            elseif var_i(i,j) == 1
                var_r(i,j) = var_2(i,j); 
                var_g(i,j) = V(i,j);
                var_b(i,j) = var_1(i,j);
            elseif var_i(i,j) == 2
                var_r(i,j) = var_1(i,j); 
                var_g(i,j) = V(i,j); 
                var_b(i,j) = var_3(i,j);
            elseif var_i(i,j) == 3
                var_r(i,j) = var_1(i,j); 
                var_g(i,j) = var_2(i,j); 
                var_b(i,j) = V(i,j);
            elseif var_i(i,j) == 4 
                var_r(i,j) = var_3(i,j); 
                var_g(i,j) = var_1(i,j); 
                var_b(i,j) = V(i,j);
            else
                var_r(i,j) = V(i,j); 
                var_g(i,j) = var_1(i,j); 
                var_b(i,j) = var_2(i,j);
            end
            
        R(i,j) = var_r(i,j) * 255;
        G(i,j) = var_g(i,j) * 255;
        B(i,j) = var_b(i,j) * 255;
        end
    end
end
