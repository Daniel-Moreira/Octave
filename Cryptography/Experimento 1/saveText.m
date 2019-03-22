function x = saveText(texto,nome)
% saveText saves a string in an ASCII file
%   RESULT = saveText(TEXT,NAMEFILE) receives a string TEXT, and writes in 
%   the ASCII file in the path NAMEFILE. If it succeeds, returns in RESULT 
%   the number of characters written, otherwise returns the result of open 
%   file nameFile.

fid = fopen(nome,'w');

if fid > 0
    x = fprintf(fid,'%s',texto);
	fclose(fid);
else
    x = fid;
end


end
