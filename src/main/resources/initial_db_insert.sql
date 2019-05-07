# MAIN CATEGORIES
INSERT INTO `oddam`.`categories` (`id`, `name`)
VALUES ('1', 'Typ instytucji'),
       ('2', 'Komu pomagamy'),
       ('3', 'Co potrzebujemy'),
       ('4', 'Co do oddania');

# SUB CATEGORIES
# Typ instytucji
INSERT INTO `oddam`.`categories` (`id`, `name`, `parent_id`)
VALUES ('5', 'Fundacja', '1'),
       ('6', 'Organizacja Pozarządowa', '1'),
       ('7', 'Lokalna Zbiórka', '1');

# Komu pomagamy
INSERT INTO `oddam`.`categories` (`id`, `name`, `parent_id`)
VALUES ('8', 'Dzieciom', '2'),
       ('9', 'Samotnym matkom', '2'),
       ('10', 'Bezdomnym', '2'),
       ('11', 'Niepełnosprawnym', '2'),
       ('12', 'Osobom starszym', '2');

# Co potrzebujemy
INSERT INTO `oddam`.`categories` (`id`, `name`, `parent_id`)
VALUES ('13', 'ubrania', '3'),
       ('14', 'ciepłe koce', '3'),
       ('15', 'jedzenie', '3'),
       ('16', 'meble', '3'),
       ('17', 'zabawki', '3'),
       ('18', 'sprzęt AGD', '3'),
       ('19', 'sprzęt dla dzieci', '3'),
       ('20', 'elektronika', '3'),
       ('21', 'artykuły szkolne', '3'),
       ('22', 'kosmetyki', '3'),
       ('23', 'książki', '3'),
       ('24', 'gry', '3'),
       ('25', 'instrumenty', '3'),
       ('26', 'film i muzyka', '3');

# Co do oddania
INSERT INTO `oddam`.`categories` (`id`, `name`, `parent_id`)
VALUES ('27', 'ubrania które nadają się do ponownego użycia', '4'),
       ('28', 'ubrania, do wyrzucenia', '4'),
       ('29', 'zabawki', '4'),
       ('30', 'książki', '4'),
       ('31', 'inne', '4');

INSERT INTO `oddam`.`addresses` (`id`, `city`, `flat_number`, `house_number`, `street`, `zip_code`, `user_id`)
VALUES ('1', 'Gdańsk', '7', '17', 'Aleje Grunwaldzkie', '80-210', '1'),
       ('2', 'Warszawa', '', '10', 'Piastowska', '00-320', '2'),
       ('3', 'Wrocłąw', '2', '1', 'Bażantowa', '21-321', '3'),
       ('4', 'Kraków', '', '25', 'Kasztanowa', '07-070', '4'),
       ('5', 'Łódź', '1', '1', 'Stokłosy', '30-990', '5'),
       ('6', 'Poznań', '32', '10', 'Mysia', '56-123', '6'),
       ('7', 'Warszawa', '', '107', 'Jeleniogórska', '00-123', '7'),
       ('8', 'Gdańsk', '', '100', 'Aleja Jana Pawła II', '80-213', '8'),

       ('9', 'Poznań', '2', '120', 'Puszysta', '50-003', '100'),
       ('10', 'Kraków', '', '19', 'Sąsiedzka', '20-223', '101'),
       ('11', 'Łódź', '65', '122', 'Zwycięzców Monte Casino', '33-123', '102');


INSERT INTO `oddam`.`roles` (`role`)
VALUES ('ROLE_USER'),
       ('ROLE_INSTITUTION'),
       ('ROLE_ADMIN'),
       ('ROLE_SUPERADMIN');


# Admins password = admin
INSERT INTO `oddam`.`users` (`id`, `created`, `username`, `password`, `enabled`, `email`, `phone_number`,
                             `user_first_name`, `user_last_name`)
VALUES ('1', '2019-03-04 15:00:00', 'admin', '$2a$10$s3g9QrbfZv8v3cx7viNJOu4V7gcsnrz5Hzm8OqjRXjLMak7Td.42C', TRUE,
        'admin@main.pl', '123456789',
        'Arkadiusz', 'Kowalski'),
       ('2', '2019-03-01 11:00:00', 'admin2', '$2a$10$s3g9QrbfZv8v3cx7viNJOu4V7gcsnrz5Hzm8OqjRXjLMak7Td.42C', TRUE,
        'admin@second.pl',
        '123123123', 'Paweł', 'Słomiński'),
       ('3', '2019-04-04 22:00:00', 'admin3', '$2a$10$s3g9QrbfZv8v3cx7viNJOu4V7gcsnrz5Hzm8OqjRXjLMak7Td.42C', TRUE,
        'admin@third.pl',
        '123456788', 'John', 'Smith');


# Users password = user
INSERT INTO `oddam`.`users` (`id`, `created`, `username`, `password`, `enabled`, `email`, `phone_number`,
                             `user_first_name`, `user_last_name`)
VALUES ('4', '2019-02-04 07:00:00', 'Jarkow', '$2a$10$7zc7spg6w6U8.CKunvcsOe64CtUbo3vRH3TKbIr5sMQ8WNU68/61.', TRUE,
        'user@main.pl', '987654321',
        'Jarosław', 'Kowalski'),
       ('5', '2019-02-04 10:00:00', 'smoli67', '$2a$10$7zc7spg6w6U8.CKunvcsOe64CtUbo3vRH3TKbIr5sMQ8WNU68/61.', TRUE,
        'user@second.pl',
        '123443211', 'Adrian', 'Smolarek'),
       ('6', '2019-01-14 17:00:00', 'madzia', '$2a$10$7zc7spg6w6U8.CKunvcsOe64CtUbo3vRH3TKbIr5sMQ8WNU68/61.', TRUE,
        'user@third.pl', '888777666',
        'Magdalena', 'Kręcisz'),
       ('7', '2019-01-23 15:00:00', 'crazyGirl', '$2a$10$7zc7spg6w6U8.CKunvcsOe64CtUbo3vRH3TKbIr5sMQ8WNU68/61.', TRUE,
        'user@fourth.pl', '121323434',
        'Julie', 'Bucket'),
       ('8', '2019-01-10 13:30:00', 'Warrior', '$2a$10$7zc7spg6w6U8.CKunvcsOe64CtUbo3vRH3TKbIr5sMQ8WNU68/61.', TRUE,
        'user@fifth.pl', '343565787',
        'Adam', 'Samson');

# Institutions password = institution, on default account disabled
INSERT INTO `oddam`.`users` (`id`, `created`, `username`, `password`, `enabled`, `email`, `institution_name`,
                             `phone_number`, `institution_type_id`, `institution_goal_and_mission`)
VALUES ('100', '2019-02-02 07:00:00', 'institution', '$2a$10$abBHifNBp3Spqw/u.zkJguXzE9M2hOOXZ1H8531Dn1kHRgtu8Oyi6',
        FALSE,
        'institution@main.pl', 'Dla Malucha', '888777666', '5', 'Pomoc dzieciom pozbawionym rodziny'),
       ('101', '2019-02-05 09:00:00', 'institution2', '$2a$10$abBHifNBp3Spqw/u.zkJguXzE9M2hOOXZ1H8531Dn1kHRgtu8Oyi6',
        FALSE,
        'institution@second.pl', 'Dla Dziadka', '123456789', '6', 'Pomoc osobom starszym bez wsparcia'),
       ('102', '2019-02-07 15:00:00', 'institution3', '$2a$10$abBHifNBp3Spqw/u.zkJguXzE9M2hOOXZ1H8531Dn1kHRgtu8Oyi6',
        FALSE,
        'institution@third.pl', 'Bez domu', '123456789', '5', 'Pomoc osobom bez domu');

INSERT INTO `oddam`.`users_role` (`users_id`, `role_id`)
VALUES ('1', '3'),
       ('2', '3'),
       ('3', '3'),
       ('4', '1'),
       ('5', '1'),
       ('6', '1'),
       ('7', '1'),
       ('8', '1'),
       ('100', '2'),
       ('101', '2'),
       ('102', '2');

INSERT INTO `oddam`.institutions_helps_who (users_id, categories_id)
VALUES ('100', '8'),
       ('101', '12'),
       ('102', '10');

insert into `oddam`.institutions_needs_what (users_id, categories_id)
VALUES ('100', '13'),
       ('100', '17'),
       ('100', '23'),
       ('100', '24'),
       ('101', '26'),
       ('101', '19'),
       ('101', '14'),
       ('102', '15'),
       ('102', '13'),
       ('102', '15'),
       ('102', '16');

INSERT INTO `oddam`.donations (id, created, pick_up_comment, pick_up_date, pick_up_phone_number,
                               pick_up_time, quantity, institution_details_id, pick_up_address_id,
                               user_details_id)
VALUES ('1', '2019-02-02 07:00:00', 'Mieszkam na drugim piętrze. Zapraszam!', '2019-02-05', '123321123', '09:00:00',
        '2', '100', '1', '8'),
       ('2', '2019-01-12 17:00:00', 'Będę czekać na Państwa ok 11:00', '2019-02-01', '111222333', '11:00:00', '4',
        '101', '2', '4'),
       ('3', '2019-01-11 22:00:00', 'Mamy tego sporo ale mąż pomoże się zabrać', '2019-01-22', '567765432', '14:00:00',
        '2', '100', '3', '7'),
       ('4', '2019-02-04 09:00:00', 'Czekam', '2019-01-05', '789098765', '17:00:00', '2', '101', '4', '4'),
       ('5', '2019-02-03 16:00:00', 'Prosze wejść drugmi drzwiami po prawej', '2019-01-15', '123456789', '10:00:00',
        '2', '101', '5', '5'),
       ('6', '2019-02-04 18:00:00', 'Proszę najpierw zadzwonić!', '2019-01-19', '654321678', '20:00:00', '2', '102',
        '6', '6'),
       ('7', '2019-02-03 21:00:00', 'Trzeci lokal po prawej', '2019-02-02', '876876567', '08:00:00', '2', '102', '7',
        '7');

INSERT INTO `oddam`.donations_type (donations_id, categories_id)
VALUES ('1', '27'),
       ('1', '28'),
       ('2', '29'),
       ('3', '30'),
       ('4', '30'),
       ('5', '27'),
       ('5', '29'),
       ('6', '31'),
       ('7', '27');

INSERT INTO `oddam`.users_donations (user_id, donations_id)
VALUES ('1', '1'),
       ('2', '2'),
       ('3', '3'),
       ('4', '4'),
       ('5', '5'),
       ('6', '6'),
       ('7', '7');



