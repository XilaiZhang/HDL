%% From http://www.voidcn.com/article/p-nddaxtub-bqn.html
%Modifed


fid = fopen('Bitmaps.txt', 'wt');



b=imread('A.bmp');
fprintf(fid, 'localparam [4095:0]A_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('B.bmp');
fprintf(fid, 'localparam [4095:0]B_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('C.bmp');
fprintf(fid, 'localparam [4095:0]C_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('D.bmp');
fprintf(fid, 'localparam [4095:0]D_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('E.bmp');
fprintf(fid, 'localparam [4095:0]E_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('F.bmp');
fprintf(fid, 'localparam [4095:0]F_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('G.bmp');
fprintf(fid, 'localparam [4095:0]G_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('H.bmp');
fprintf(fid, 'localparam [4095:0]H_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('I.bmp');
fprintf(fid, 'localparam [4095:0]I_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('J.bmp');
fprintf(fid, 'localparam [4095:0]J_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('K.bmp');
fprintf(fid, 'localparam [4095:0]K_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('L.bmp');
fprintf(fid, 'localparam [4095:0]L_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('M.bmp');
fprintf(fid, 'localparam [4095:0]M_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('N.bmp');
fprintf(fid, 'localparam [4095:0]N_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('O.bmp');
fprintf(fid, 'localparam [4095:0]O_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('P.bmp');
fprintf(fid, 'localparam [4095:0]P_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('Q.bmp');
fprintf(fid, 'localparam [4095:0]Q_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('R.bmp');
fprintf(fid, 'localparam [4095:0]R_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('S.bmp');
fprintf(fid, 'localparam [4095:0]S_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('T.bmp');
fprintf(fid, 'localparam [4095:0]T_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('U.bmp');
fprintf(fid, 'localparam [4095:0]U_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');
b=imread('V.bmp');
fprintf(fid, 'localparam [4095:0]V_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('W.bmp');
fprintf(fid, 'localparam [4095:0]W_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('X.bmp');
fprintf(fid, 'localparam [4095:0]X_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('Y.bmp');
fprintf(fid, 'localparam [4095:0]Y_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('Z.bmp');
fprintf(fid, 'localparam [4095:0]Z_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('QuestionMark.bmp');
fprintf(fid, 'localparam [4095:0]QuestionMark_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');

b=imread('Dash.bmp');
fprintf(fid, 'localparam [4095:0]Dash_BMP = {\n\t');
for i=1:64
  for j=1:64
      fprintf(fid, '1''b%d', (b(i,j)!=0));
      if (i != 64 || j != 64)
        fprintf(fid,',');
      end
  end
  if (i == 64)
    fprintf(fid,'\n');
  else
    fprintf(fid,'\n\t');
  end
end
fprintf(fid, '};\n');




disp('Text file write done');
disp(' ');
fclose(fid);