function text = readText(nameFile)
% readText reads an ASCII file
%   TEXT = readText(NAMEFILE) receives a string NAMEFILE, and readS the 
%   ASCII file in the path NAMEFILE and return a line vector in TEXT.

fid = fopen(nameFile,'r');

text = [];
if fid > 0
	while (~feof(fid))
		linha = fgets(fid);
	        text = [text linha];        
	end 
	fclose(fid);
end


end
