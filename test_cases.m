% Provided Test Cases
[result_1, status_1] = AllRoots([1 0 -10], 1+1i, 0.000001, 50,0);
[result_2, status_2] = AllRoots([1 0 0 0 -10], 0.1-1i, 0.00000000001, 1000,0);
[result_3, status_3] = AllRoots([1 0 0 0 1], 1+1i, 0.000001, 50,0);
[result_4, status_4] = AllRoots([1,-2,1], 1+1i, 0.000001, 50,0);
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
    2432902008176640000], 1+1i, 0.00000000001, 100,0);

% Our Test Cases
[result_6, status_6] = AllRoots([2 3 0 1 3 -3], 2-2j, 0.001, 10);
[result_7, status_7] = AllRoots([4 0 0 3], 1+1j, 0.0001, 50);
[result_8, status_8] = AllRoots([1 -7 19 -25 16 -4], 1-1i, 0.00001, 50);
[result_9, status_9] = AllRoots([1 -99 -100], 1-1i, 0.0001, 50);
[result_10, status_10] = AllRoots([4 20 69], 2+1j, 0.00001, 50);

fprintf('\nx^2 - 10: ')
disp(result_1)
fprintf('Status: ')
disp(status_1)

fprintf('\nx^4 - 10: ')
disp(result_2)
fprintf('Status: ')
disp(status_2)

fprintf('\nx^4 + 1: ')
disp(result_3)
fprintf('Status: ')
disp(status_3)

fprintf('\nx^2 - 2*x + 1: ')
disp(result_4)
fprintf('Status: ')
disp(status_4)

fprintf('\nWilkinsons: ')
disp(result_5)
fprintf('Status: ')
disp(status_5)

fprintf('\n2*x^5 + 3*x^4 + x^2 + 3*x - 3: ')
disp(result_6)
fprintf('Status: ')
disp(status_6)

fprintf('\n4*x^3 + 3: ')
disp(result_7)
fprintf('Status: ')
disp(status_7)

fprintf('\nx^5 - 7*x^4 + 19*x^3 -25*x^2 + 16*x - 4: ')
disp(result_8)
fprintf('Status: ')
disp(status_8)

fprintf('\nx^2 - 99*x - 100: ')
disp(result_9)
fprintf('Status: ')
disp(status_9)

fprintf('\n4*x^2 + 20*x + 69: ')
disp(result_10)
fprintf('Status: ')
disp(status_10)