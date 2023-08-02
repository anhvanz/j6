USE master
GO
CREATE DATABASE DaviTickets
GO
--   DROP DATABASE DaviTickets
USE DaviTickets;
GO



CREATE TABLE roles(
    role_id INT IDENTITY PRIMARY KEY NOT NULL,
	[name] NVARCHAR(50) NOT NULL,
	role_des NVARCHAR(max) NULL
)

--Người dùng
CREATE TABLE users (
	userid INT IDENTITY PRIMARY KEY NOT NULL,
	full_name NVARCHAR(50) NOT NULL,
	user_name NVARCHAR(20) NOT NULL,
	gender NVARCHAR(5) NULL,
	user_password NVARCHAR(MAX) NOT NULL,
	phone VARCHAR(20) NULL,
	email NVARCHAR(100) NOT NULL,
	profile_picture NVARCHAR(MAX) NULL,
	account_status BIT NULL, --trạng thái hoạt động
	processed_by BIT NULL, --xác thực
	user_birtday DATE NULL,
	user_dayjoin DATE NOT NULL,
	gg_id NVARCHAR(MAX) NULL,
)

CREATE TABLE user_role(
	id INT IDENTITY PRIMARY KEY NOT NULL,
	userid INT NOT NULL FOREIGN KEY REFERENCES users(userid), --id ng dung
	role_id INT NOT NULL FOREIGN KEY REFERENCES roles(role_id)--Vai trò người dùng
)


INSERT INTO roles VALUES
	('ADMIN',N'Quản trị web'),
	('USER',N'Người dùng')

INSERT INTO users VALUES 
	(N'Quách Hữu Nghĩa',N'nghiahq', 'Nam', N'$2a$10$WzBhlbBVtJxyafSiM1os9.4S0tDkSmoYgWY/om0Ma7dBBz9jlpUUq', N'012346789', N'nghiaqh@fe.edu.vn', 'https://firebasestorage.googleapis.com/v0/b/davitickets-2e627.appspot.com/o/thaynghia.jpg?alt=media&token=9fc95aed-1dfe-4b87-8ebe-2903ffd50678', 1, 1, CAST('1-1-1990' AS DATE), CAST('7-22-2023' AS DATE), NULL),
	(N'Nguyễn Văn An',N'annv', 'Nam', N'$2a$10$WzBhlbBVtJxyafSiM1os9.4S0tDkSmoYgWY/om0Ma7dBBz9jlpUUq', N'012346789', N'annv@fe.edu.vn', 'https://firebasestorage.googleapis.com/v0/b/davitickets-2e627.appspot.com/o/thaynghia.jpg?alt=media&token=9fc95aed-1dfe-4b87-8ebe-2903ffd50678', 1, 1, CAST('1-1-1990' AS DATE), CAST('7-22-2023' AS DATE), NULL),
	(N'Lê Thị Bình',N'binhlt', 'Nam', N'$2a$10$WzBhlbBVtJxyafSiM1os9.4S0tDkSmoYgWY/om0Ma7dBBz9jlpUUq', N'012346789', N'binhlt@fe.edu.vn', 'https://firebasestorage.googleapis.com/v0/b/davitickets-2e627.appspot.com/o/thaynghia.jpg?alt=media&token=9fc95aed-1dfe-4b87-8ebe-2903ffd50678', 1, 1, CAST('1-1-1990' AS DATE), CAST('7-22-2023' AS DATE), NULL)

INSERT INTO user_role VALUES
	(1,1),
	(1,2),
	(2,1),
	(2,2)


select * from roles
select * from users
select * from user_role

SELECT r.name, r.role_des as name FROM users u INNER JOIN user_role ur ON u.userid = ur.userid 
						INNER JOIN roles r ON r.role_id =ur.role_id  and u.email='nghiaqh@fe.edu.vn'