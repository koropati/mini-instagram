function h =  Gaussian2D(hsize, sigma)

n1 = hsize;
n2 = hsize;
Gauss = zeros(n1, n2);
for i = 1 : n2 
        for j = 1 : n1
        % size is 10;
        % -5<center<5 area is covered.
        c = [j-(n1+1)/2 i-(n2+1)/2]';                
        % A product of both axes is 2D Gaussian filtering
        h(i,j) = Gauss(c(1), sigma)*Gauss(c(2), sigma);        
        end
end
    Gaussian2D=h