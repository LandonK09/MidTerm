% Author Name: Landon Keveanos 
% Email: Kevean28@students.rowan.edu
% Course: MATLAB Programming - Fall 2024
% Assignment: Midterm
% Date:11/10/24
%prt4
%Main Script

% Making my student database
db = StudentDatabase();

% inputing "students"
student1 = Student('S001', 'Landon Keveanos', 20, 3.6, 'Mechanical Engineering');
student2 = Student('S002', 'Reese Keveanos', 22, 3.4, 'Physcology');
student3 = Student('S003', 'Brian Mccarrick', 20, 3.2, 'Computer Science');
student4 = Student('S004', 'Logan Haltner', 20, 2.8, 'Mechanic');
student5 = Student('S005', 'Eric King', 20, 3.7, 'Engineering Tech');
Student6 = Student('S006', 'Mehdi Bouhkari', 24, 3.2, 'Criminal Justice');

% adding my specified studetns to the data base
db = db.addStudent(student1);
db = db.addStudent(student2);
db = db.addStudent(student3);
db = db.addStudent(student4);
db = db.addStudent(student5);

% find any students by finding their id 
studentID = input('Input the student ID you want to find (S000-S007): ', 's');
foundStudent = db.findStudentByID(studentID);
if ~isempty(foundStudent)
    foundStudent.displayInfo();
else
    disp('Student not found.');
end

% Get students by major
ComputerSciStudents = db.getStudentsByMajor('Computer Science');
disp('Students majoring in Computer Science:');
for i = 1:length(ComputerSciStudents)
    ComputerSciStudents{i}.displayInfo();
end

% Save the database
db.saveToFile('studentDatabase.mat');

% Load the database 
loadedDB = StudentDatabase();
loadedDB = loadedDB.loadFromFile('studentDatabase.mat');

% Visualizing the data with the graphs
visualizeData(loadedDB);
