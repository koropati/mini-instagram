function MOutput=filter_dilasi(MInput,window_size)
[row,col,chan]=size(MInput);
%window_size=ganjil;
border_size=(window_size-1)/2;
%SetLength(MOutput,Length(MInput)-(2*border_size),Length(MInput[0])-(2*border_size));
MOutput=uint8(zeros(size(MInput,1)-(2*border_size),size(MInput,2)-(2*border_size)));
%SetLength(MFilter,window_size,windows_size);
MFilter=uint8(zeros(window_size,window_size));

if chan==3
  MInput=rgbTogrey(MInput);
end
    for i=border_size+1:size(MInput,1)-border_size
        for j=border_size+1:size(MInput,2)-border_size
            for i_mfilter=1:window_size
                for j_mfilter=1:window_size
                    MFilter(i_mfilter,j_mfilter)=MInput(i-border_size+i_mfilter-1,j-border_size+j_mfilter-1);
                end
            end
            MOutput(i-border_size,j-border_size)=min(MFilter(:));
        end
    end

filter_dilasi=MOutput;