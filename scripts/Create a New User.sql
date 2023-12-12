-- Create a New User
CREATE LOGIN YourLogin WITH PASSWORD = 'YourPassword';
USE YourDatabase;
CREATE USER YourUser FOR LOGIN YourLogin;