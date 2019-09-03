function img_out = img_gaussian(img_in)

I = double(img_in);

sigma = 1.90;
%Window size
sz = 1;
[x,y]=meshgrid(-sz:sz,-sz:sz);

M = size(x,1)-1;
N = size(y,1)-1;
Exp_comp = -(x.^2+y.^2)/(2*sigma*sigma);
Kernel= exp(Exp_comp)/(2*pi*sigma*sigma);
%Initialize
Output=zeros(size(I));
%Pad the vector with zeros
I = padarray(I,[sz sz]);

%Convolution
for i = 1:size(I,1)-M
	for j =1:size(I,2)-N
		Temp = I(i:i+M,j:j+M).*Kernel;
		Output(i,j)=sum(Temp(:));
	end
end
%Image without Noise after Gaussian blur
img_out = uint8(Output);
img_gaussian=img_out