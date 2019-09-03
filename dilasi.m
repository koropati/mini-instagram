function MOutput=dilasi(MInput,window_size)
%window_size=ganjil;
%border_size=window_size div 2;
border_size=(window_size-1)/2;

%SetLength(MOutput,Length(MInput)-(2*border_size),Length(MInput[0])-(2*border_size));
MOutput=uint8(zeros(size(MInput,1)-(2*border_size),size(MInput,2)-(2*border_size)));
% x=size(MInput,1)-(2*border_size);
% y=size(MInput,2)-(2*border_size);
% MOutput=size(x,y);

%SetLength(MFilter,window_size,windows_size);
MFilter=uint8(zeros(window_size,window_size));
%MFilter=size(window_size,window_size);

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
dilasi=MOutput;