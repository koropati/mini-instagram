function img_out=bukaTutup(img_in, jum,pilihan)
if pilihan==1
    %opening
    img_out=filter_dilasi((filter_erosi(img_in, jum)),jum);
elseif pilihan==0
    %closing
    img_out=filter_erosi((filter_dilasi(img_in, jum)),jum);
end

bukaTutup=img_out;