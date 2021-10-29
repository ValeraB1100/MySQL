#эта бд работает примерно как гикбрейнс, тоже обучалки, несколько курсов по видеомонтажу или что-то в этом роде.
-- блок пользователей
-- 1.пользователи(id, имя, фамилия)
-- 2.профиль(id, пользователи_id, дата рождения, город, дата регистрации,)
-- 
-- блок курсов
-- 3.направления курсов(id, 1, 2, 3)
-- 4.курсы(id,направления_курсов_id, пользователи_id,  название, описание, цена)
-- 5.вебинары(id, направления_курсов_id, пользователи_id, название, краткое описание, дата проведения)
-- 
-- коментарии к курсам и вебинарам
-- 6.коментарии к курсам(id, пользователи_id, курсы_id, коментарий, дата написания комментария)
-- 7.коментарии к вебинарам(id, пользователи_id, вебинары_id, коментарий, дата написания комментария)
-- 
-- 8.участники проекта(id, пользователи_id)
-- 9.примеры работ(id, участникии_проекта_id, название, дата создания)
-- 10.форум(id, тема форума, пользователи_id, сообщение, дата отправки сообщения)

DROP DATABASE IF EXISTS void_signature;
CREATE DATABASE void_signature;
USE void_signature;

#блок пользователей
#пользователи(id, имя, фамилия)

DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
	first_name VARCHAR(256),
	last_name VARCHAR(256)	
) COMMENT = 'пользователи';

INSERT INTO users (first_name, last_name) VALUES
('Олег', 'Брежнев'),
('Мария', 'Конева'),
('Александр', 'Мишуткин'),
('Анастасия', 'Сланцева'),
('Петр', 'Сивцев'),
('Антон', 'Игнатьев'),
('Яна', 'Губова'),
('Семен', 'Бессонов'),
('Мила', 'Йовович'),
('Валерий', 'Петров');

#профиль(id, пользователи_id, дата рождения, город, дата регистрации,)
DROP TABLE IF EXISTS profile_users;
CREATE TABLE profile_users(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
	users_id INT UNSIGNED,
	birthday DATE,
	city VARCHAR(256),
	create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	KEY users_id (users_id),
	CONSTRAINT `profile_for_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
	
) COMMENT = 'профили пользователей';

INSERT INTO profile_users (users_id, birthday, city) VALUES
(1, '1984-12-05', 'Белово'),
(2, '1981-02-05', 'Астрахань'),
(3, '1994-12-05', 'Белово'),
(4, '1999-10-15', 'Сочи'),
(5, '2000-01-25', 'Новосибирск'),
(6, '1984-12-05', 'Новокузнецк'),
(7, '2001-07-17', 'Белово'),
(8, '1959-07-17', 'Кемерово'),
(9, '2001-05-31', 'Белово'),
(10, '1987-09-19', 'Москва');

#блок курсов
#направления курсов(id, НАПРАВЛЕНИЯ)

DROP TABLE IF EXISTS course_directions;
CREATE TABLE course_directions(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`course_directions` VARCHAR(256)
) COMMENT = 'направления курсов';

INSERT INTO course_directions (`course_directions`) VALUES
('Видеопроект'),
('Режиссура'),
('Фотопроект');


#курсы(id,направления_курсов_id,   название, описание, цена)
DROP TABLE IF EXISTS courses;
CREATE TABLE courses(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
	course_directions_id INT UNSIGNED ,
	course_name VARCHAR(256),
	body TEXT,
	price DECIMAL (11,2),
	CONSTRAINT `courses_for_course_directions` FOREIGN KEY (`course_directions_id`) REFERENCES `course_directions` (`id`)
) COMMENT = 'курсы';

INSERT INTO courses (`course_directions_id`, course_name, body, price) VALUES
(1, 'Видеомонтаж', 'Здесь вы научитесь монтажу видео', 20000),
(1, 'Видео на ютуб', 'Здесь вы научитесь монтажу видео', 30000),
(2, 'режиссура', 'Здесь вы научитесь монтажу видео', 35000),
(2, 'еще режиссура', 'Здесь вы научитесь монтажу видео', 43500),
(3, 'фоточки', 'Здесь вы научитесь монтажу видео', 12300),
(3, 'еще фотопроект', 'Здесь вы научитесь монтажу видео', 15000),
(3, 'фото природы', 'Здесь вы научитесь монтажу видео', 25000),
(2, 'актерское мастерство', 'Здесь вы научитесь монтажу видео', 23000),
(1, 'Видео на ютуб_1', 'Здесь вы научитесь монтажу видео', 41000),
(1, 'Видео на ютуб_2', 'Здесь вы научитесь монтажу видео', 17000);




#вебинары(id, направления_курсов_id, название, краткое описание, дата проведения)
DROP TABLE IF EXISTS webinars;
CREATE TABLE webinars(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
	webinars_directions_id INT UNSIGNED ,
	webinars_name VARCHAR(256),
	body TEXT,
	date_of_the_webinar DATETIME,
	CONSTRAINT `webinars_for_course_directions` FOREIGN KEY (`webinars_directions_id`) REFERENCES `course_directions` (`id`)
) COMMENT = 'вебинары';

INSERT INTO webinars (`webinars_directions_id`, webinars_name, body) VALUES
(1, 'Видеомонтаж', 'Здесь вы научитесь монтажу видео'),
(1, 'Видео на ютуб', 'Здесь вы научитесь монтажу видео'),
(2, 'режиссура', 'Здесь вы научитесь монтажу видео'),
(2, 'еще режиссура', 'Здесь вы научитесь монтажу видео'),
(3, 'фоточки', 'Здесь вы научитесь монтажу видео'),
(3, 'еще фотопроект', 'Здесь вы научитесь монтажу видео'),
(3, 'фото природы', 'Здесь вы научитесь монтажу видео'),
(2, 'актерское мастерство', 'Здесь вы научитесь монтажу видео'),
(1, 'Видео на ютуб_1', 'Здесь вы научитесь монтажу видео'),
(1, 'Видео на ютуб_2', 'Здесь вы научитесь монтажу видео');


-- коментарии к курсам и вебинарам
-- 6.коментарии к курсам(id, пользователи_id, курсы_id, коментарий, дата написания комментария)
DROP TABLE IF EXISTS course_comments;
CREATE TABLE course_comments(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
	users_id INT UNSIGNED,
	course_id INT UNSIGNED,
	body TEXT,
	create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT `course_comments_for_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
	CONSTRAINT `course_id_for_courses` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
)COMMENT = 'коментарии к курсам';

INSERT INTO course_comments (`users_id`, course_id, body) VALUES
(1, 1, 'Здесь вы научитесь монтажу видео'),
(1, 2, 'Здесь вы научитесь монтажу видео'),
(2, 3, 'Здесь вы научитесь монтажу видео'),
(2, 4, 'Здесь вы научитесь монтажу видео'),
(3, 4, 'Здесь вы научитесь монтажу видео'),
(3, 3, 'Здесь вы научитесь монтажу видео'),
(3, 1, 'Здесь вы научитесь монтажу видео'),
(2, 3, 'Здесь вы научитесь монтажу видео'),
(1, 3, 'Здесь вы научитесь монтажу видео'),
(1, 3, 'Здесь вы научитесь монтажу видео');



-- 7.коментарии к вебинарам(id, пользователи_id, вебинары_id, коментарий, дата написания комментария)
DROP TABLE IF EXISTS webinars_comments;
CREATE TABLE webinars_comments(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
	users_id INT UNSIGNED,
	webinars_id INT UNSIGNED,
	body TEXT,
	create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT `webinars_comments_for_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
	CONSTRAINT `webinars_id_for_courses` FOREIGN KEY (`webinars_id`) REFERENCES `webinars` (`id`)
)COMMENT = 'коментарии к вебинарам';

INSERT INTO webinars_comments (`users_id`, webinars_id, body) VALUES
(1, 1, 'Здесь вы научитесь монтажу видео'),
(1, 2, 'Здесь вы научитесь монтажу видео'),
(2, 3, 'Здесь вы научитесь монтажу видео'),
(2, 4, 'Здесь вы научитесь монтажу видео'),
(3, 4, 'Здесь вы научитесь монтажу видео'),
(3, 3, 'Здесь вы научитесь монтажу видео'),
(3, 1, 'Здесь вы научитесь монтажу видео'),
(2, 3, 'Здесь вы научитесь монтажу видео'),
(1, 3, 'Здесь вы научитесь монтажу видео'),
(1, 3, 'Здесь вы научитесь монтажу видео');

 
-- 8.участники проекта(id, пользователи_id)

DROP TABLE IF EXISTS project_participants;
CREATE TABLE project_participants(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
	users_id INT UNSIGNED,
	CONSTRAINT `project_participants_for_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) COMMENT = 'пользователи';

INSERT INTO project_participants (`users_id`) VALUES
(1),
(2),
(3),
(4),
(5);


-- 9.примеры работ(id, участникии_проекта_id, название, дата создания)

DROP TABLE IF EXISTS work_examples;
CREATE TABLE work_examples(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
	project_participants_id INT UNSIGNED,                      #авторы
	name_work VARCHAR(256),
	create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT `work_examples_for_project_participants` FOREIGN KEY (`project_participants_id`) REFERENCES `project_participants` (`id`)
) COMMENT = 'примеры работ';


INSERT INTO work_examples (`project_participants_id`, name_work) VALUES
(1, 'Природа'),
(2, 'Earth'),
(3, 'фото луны'),
(1, 'Семь гномов'),
(5, 'котятки'),
(4, 'еще котятки'),
(2, 'а тут щеночки'),
(1, 'еще щеночки'),
(1, 'Наши актеры');


-- 10.форум(id, тема форума, пользователи_id, сообщение, дата отправки сообщения)

DROP TABLE IF EXISTS forums;
CREATE TABLE forums(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
	name_forums VARCHAR(256),
	users_id INT UNSIGNED,
	body TEXT,
	create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT `forums_for_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) COMMENT = 'форум';


INSERT INTO forums (name_forums, `users_id`, body) VALUES
('Video', 1, 'Здесь вы научитесь монтажу видео'),
('Photo', 2, 'Здесь вы научитесь монтажу видео'),
('режиссура', 3, 'Здесь вы научитесь монтажу видео'),
('котятки', 4, 'Здесь вы научитесь монтажу видео'),
('щеночки', 4, 'Здесь вы научитесь монтажу видео'),
('природа', 3, 'Здесь вы научитесь монтажу видео'),
('еще котятки', 1, 'Здесь вы научитесь монтажу видео'),
('еще щеночки', 3, 'Здесь вы научитесь монтажу видео'),
('Video', 3, 'Здесь вы научитесь монтажу видео'),
('котятки', 3, 'Здесь вы научитесь монтажу видео');

#общий вывод таблиц users и profile_users
SELECT * 
FROM 
	users u 
JOIN 
	profile_users pu 
ON u.id = pu.users_id; 

#подсчет количества работ у которых автором является пользователь 1
SELECT 
	COUNT(name_work)
FROM work_examples we
WHERE we.project_participants_id = 1;

#сумма всех курсов по каждому направлению
SELECT course_directions_id, SUM(price) FROM courses
GROUP BY course_directions_id;

# представление выводит коментарии пользователя 1 к курсам
#тут я что-то запутался и наделал фигню(((
#ПОЧЕМУ ЕСЛИ Я ВМЕСТО JOIN ПИШУ LEFT JOIN ОН НЕ РАБОТАЕТ?
CREATE OR REPLACE VIEW users_comments(id, course, comments, create_at) AS
SELECT 
	users.id, courses.course_name, course_comments.body, course_comments.create_at 
FROM 
	users
JOIN
	courses 
JOIN
	course_comments
ON
	users.id = 1 AND course_comments.users_id = 1 AND course_comments.course_id = courses.id ;

SELECT * FROM users_comments;


#я не мог ничего путного придумать поэтому просто сделаю так
CREATE TABLE logs (
	created_at DATETIME DEFAULT NOW(),
	name_table VARCHAR(255),
	id_primary_key INT UNSIGNED NOT NULL,
  	name VARCHAR(20) NOT NULL
) ENGINE=ARCHIVE;

CREATE TRIGGER users_log AFTER INSERT ON users 
FOR EACH ROW
  INSERT INTO logs 
    SET 
      name_table = 'users',
      id_primary_key = NEW.id,
      name = NEW.first_name;


#знаю, получился бред, но я пытался, я не хочу забрасывать этот проект, хочу попробовать вывести его в люди так сказать, может что-нибудь да получится














