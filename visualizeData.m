% Author Name: Landon Keveanos 
% Email: Kevean28@students.rowan.edu
% Course: MATLAB Programming - Fall 2024
% Assignment: Midterm
% Date:11/10/24
%prt3
function visualizeData(studentDatabase)
    % Take gpa from main script to create the graph
    gpas = [];
    majors = {};
    for i = 1:length(studentDatabase.students)
        gpas = [gpas studentDatabase.students{i}.GPA];
        majors{end+1} = studentDatabase.students{i}.Major;
    end
    
    % 1. GPA Distribution graph
    figure;
    histogram(gpas, 'BinWidth', 0.1);
    title('GPA Distribution');
    xlabel('GPA');
    ylabel('Frequency');
    
    % 2. Average GPA by Major
    majorList = unique(majors);
    avgGPA = zeros(length(majorList), 1);
    for i = 1:length(majorList)
        majorGPA = gpas(strcmp(majors, majorList{i}));
        avgGPA(i) = mean(majorGPA);
    end
    figure;
    bar(avgGPA);
    set(gca, 'XTickLabel', majorList, 'XTick', 1:length(majorList));
    title('Average GPA by Major');
    xlabel('Major');
    ylabel('Average GPA');
    
    % 3. Age Distribution for the extra plot 
    ages = [];
    for i = 1:length(studentDatabase.students)
        ages = [ages studentDatabase.students{i}.Age];
    end
    figure;
    histogram(ages, 'BinWidth', 1);
    title('Age Distribution');
    xlabel('Age');
    ylabel('Frequency');
end
