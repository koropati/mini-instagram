function [Hue, Saturnation, Value]=rgbToHSV(img_in)
img_in=double(img_in);
    [row,col,chan]=size(img_in);
   R=img_in(:,:,1);
   G=img_in(:,:,2);
   B=img_in(:,:,3);

    H = zeros(size(img_in));
    S = zeros(size(img_in));
    
    
for i=1 : row
    for j=1 : col
   var_R(i,j) = ( R(i,j) / 255 );
   var_G(i,j) = ( G(i,j) / 255 );
   var_B(i,j) = ( B(i,j) / 255 );
   %var_Min1(i,j) = min( var_R(i,j), var_G(i,j));
    var_Min(i,j) = min([var_R(i,j), var_G(i,j),var_B(i,j)]);
    %var_Max1(i,j) = max( var_R(i,j), var_G(i,j));
    var_Max(i,j) = max([var_R(i,j), var_G(i,j),var_B(i,j)]);
    del_Max(i,j) = var_Max(i,j) - var_Min(i,j);
    Value(i,j) = var_Max(i,j);
if del_Max(i,j) == 0         
    H(i,j) = 0;
    S(i,j) = 0;
else                                
   S(i,j) = del_Max(i,j) / var_Max(i,j);
   del_R(i,j) = ( ( ( var_Max(i,j) - var_R(i,j) ) / 6 ) + ( del_Max(i,j) / 2 ) ) / del_Max(i,j);
   del_G(i,j) = ( ( ( var_Max(i,j) - var_G(i,j) ) / 6 ) + ( del_Max(i,j) / 2 ) ) / del_Max(i,j);
   del_B(i,j) = ( ( ( var_Max(i,j) - var_B(i,j) ) / 6 ) + ( del_Max(i,j) / 2 ) ) / del_Max(i,j);

   if var_R(i,j) == var_Max(i,j) 
       H(i,j) = del_B(i,j) - del_G(i,j);
   elseif var_G == var_Max
       H(i,j) = ( 1 / 3 ) + del_R(i,j) - del_B(i,j);
   elseif var_B(i,j) == var_Max(i,j)
       H(i,j) = ( 2 / 3 ) + del_G(i,j) - del_R(i,j);
   end
   if H(i,j) < 0
        H(i,j) =H(i,j)+1;
   end
   if H(i,j) > 1
        H(i,j) =H(i,j)-1;
   end
end

Hue(i,j)=H(i,j);
Saturnation(i,j)=S(i,j);
    end
end