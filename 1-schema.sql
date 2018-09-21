DROP TABLE `enrolment`;
DROP TABLE `assessment`;
DROP TABLE `student`;
DROP TABLE `year`;
DROP TABLE `module`;



CREATE TABLE `module`(
    `id` INT(10) UNSIGNED not null AUTO_INCREMENT,
    `name` VARCHAR(255) not null,
    `year` INT(10) not null,
    constraint pk_md_id primary key (`id`) );

CREATE TABLE `year`(
    `id` INT(10) UNSIGNED  not null AUTO_INCREMENT,  
    `label` VARCHAR(255) not null,
    constraint pk_yr_id primary key (`id`) );
    


CREATE TABLE `student`(
	`id` INT(10) UNSIGNED  not null AUTO_INCREMENT,
	`firstname` VARCHAR(255) not null,
	`lastname` VARCHAR(255) not null,
	CONSTRAINT pk_st_id PRIMARY KEY (`id`) 
);

CREATE TABLE `assessment`(
	`id_student` INT(10) UNSIGNED not null,
	`id_module` INT(10) UNSIGNED not null ,
	`attempted` DATETIME not null ,
	`passed` DATETIME,
	`grade` INT(10),
	CONSTRAINT pk_as_at_at_id PRIMARY KEY (`attempted`),
	FOREIGN KEY (`id_student`) REFERENCES `student`(`id`),
	FOREIGN KEY (`id_module`) REFERENCES `module`(`id`)
);

CREATE TABLE `enrolment`(
	`id_student` INT(10) UNSIGNED not null,
	`id_year` INT(10) UNSIGNED not null,
	`from` DATETIME not null,
	`to` DATETIME,
	FOREIGN KEY (`id_student`) REFERENCES `student`(`id`),
	FOREIGN KEY (`id_year`) REFERENCES `year`(`id`)
	
);