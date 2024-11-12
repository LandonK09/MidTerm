% Author Name: Landon Keveanos 
% Email: Kevean28@students.rowan.edu
% Course: MATLAB Programming - Fall 2024
% Assignment: Midterm
% Date:11/10/24
%prt1
classdef Student
    properties
        ID       % Student ID
        Name     % Student Name 
        Age      % Student Age 
        GPA      % Grade Point Average 
        Major    % Student Major 
    end
%starts making the constructor method
    methods
        function obj = Student(ID, Name, Age, GPA, Major)
            % Constructor to make a new student object
            if nargin > 0
                obj.ID = ID;
                obj.Name = Name;
                obj.Age = Age;
                obj.GPA = GPA;
                obj.Major = Major;
            end
        end
    end
    % Additional methods for the Student class
    methods
        function displayInfo(obj)
            %Used to display student information
            fprintf('Student ID: %s\n', obj.ID);
            fprintf('Name: %s\n', obj.Name);
            fprintf('Age: %d\n', obj.Age);
            fprintf('GPA: %.2f\n', obj.GPA);
            fprintf('Major: %s\n', obj.Major);
        end
        
        function obj = updateGPA(obj, newGPA)
            % Used to update the gpa of a student 
            if newGPA >= 0 && newGPA <= 4.0
                obj.GPA = newGPA;
                fprintf('GPA updated to %.2f\n', obj.GPA);
            else
                error('Invalid GPA. GPA must be between 0.0 and 4.0.');
            end
        end
    end
end
