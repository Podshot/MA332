function [new]=get_global( url )

% Pulls the COVID data from the website

% Inputs:
% url - website covid data

% Outputs:
% new - input covid data

% Created on 10/31/2020 by
% - Haley Braker
% - Ben Gothard
% - Madison Lindfelt

    % reads total worldwide count for confirmed, fatalities or recovered cases
    % (depending on URL)
    % adds up all cases, for all countries in the database
    sourceTable = websave('temp.csv',url);
    T = readtable(sourceTable, 'ReadVariableNames', 0);
    clc
    last_row=height(T);
    last_column=width(T);
    data_mat = table2array( T(2:last_row, 5:last_column) ) ;
    new = sum(data_mat);
    
end
