[result_1, status_1] = AllRoots([1 0 -10], 1-1i, 0.000001, 50,0);
[result_2, status_2] = AllRoots([1 0 0 0 -10], 1-1i, 0.00000000001, 1000,0);
[result_3, status_3] = AllRoots([1 0 0 0 1], 1-1i, 0.000001, 50,0);
[result_4, status_4] = AllRoots([1,-2,1], 1-1i, 0.000001, 50,0);
[result_5, status_5] = AllRoots([
   1,
   -210,
   20615,
   -1256850,
   53327946,
    -1672280820,
    40171771630,
    -756111184500,
    11310276995381,
    -135585182899530,
    1307535010540395,
    -10142299865511450,
    63030812099294896,
    -311333643161390640,
    1206647803780373360,
    -3599979517947607200,
    8037811822645051776,
    -12870931245150988800,
    13803759753640704000,
    -8752948036761600000,
    2432902008176640000], 1-1i, 0.00000000001, 100,0);
fprintf('\n')
disp(result_1)
fprintf('\n')
disp(result_2)
fprintf('\n')
disp(result_3)
fprintf('\n')
disp(result_4)
fprintf('\n')
disp(result_5)
%fprintf(FMT, 'x^2-10=0', result_1);
% fprintf(FMT, 'x^4-10=0', result_2);
% fprintf(FMT, 'x^4+1=0', result_3);
% fprintf(FMT, 'x^2-2x+1=0', result_4);
% fprintf(FMT, "Wilkinson's Polynomial", result_5);