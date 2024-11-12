% Author Name: Landon Keveanos 
% Email: Kevean28@students.rowan.edu
% Course: MATLAB Programming - Fall 2024
% Assignment: Midterm
% Date:11/10/24
%part2
classdef StudentDatabase
    % StudentDatabase 
    properties
        students % Cell array of the students
    end
    methods
        % Constructor for the main code to use  
        function obj = StudentDatabase()
            obj.students = {};
        end
        % Adds a new student to the database
        function obj = addStudent(obj, student)
            % Allows students to be added to the database
            if isa(student, 'Student')
                obj.students{end+1} = student; 
            else
                error('Input must be a Student object.');
            end
        end
        % Find a student by ID
        function student = findStudentByID(obj, studentID)
            % Searchs for the student an ID
            student = [];
            for i = 1:length(obj.students)
                if strcmp(obj.students{i}.ID, studentID)
                    student = obj.students{i};
                    return;
                end
            end
            if isempty(student)
                disp('Student not found.');
            end
        end
        
        % Generates a list of students by major
        function studentsList = getStudentsByMajor(obj, major)
            % Return all students with the specified major
            studentsList = {};
            for i = 1:length(obj.students)
                if strcmp(obj.students{i}.Major, major)
                    studentsList{end+1} = obj.students{i};
                end
            end
        end
        
        % Saves the student database to a .mat file
        function saveToFile(obj, filename)
            % Save the database to a .mat file
            try
                save(filename, 'obj');
                disp(['Database saved to ' filename]);
            catch
                disp('Error saving the database.');
            end
        end
        
        % Load the student database from a .mat file
        function obj = loadFromFile(obj, filename)
            % Load the database from a .mat file
            try
                loadedData = load(filename);
                obj = loadedData.obj;
                disp(['Database loaded from ' filename]);
            catch
                disp('Error loading the database.');
            end
        end
    end
end
