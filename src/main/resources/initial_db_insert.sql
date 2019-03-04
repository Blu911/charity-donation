INSERT INTO `oddam`.`categories` (`name`) VALUES
('ubrania, które nadają się do ponownego użycia'),
('ubrania, do wyrzucenia'),
('zabawki'),
('książki'),
('inne');

INSERT INTO `oddam`.`addresses` (`city`, `flat_number`, `house_number`, `street`, `zip_code`)
VALUES ('Gdańsk', '7', '17', 'Aleje Grunwaldzkie', '80-210'),
       ('Warszawa', '', '10', 'Piastowska', '00-320'),
       ('Wrocłąw', '2', '1', 'Bażantowa', '21-321'),
       ('Kraków', '', '25', 'Kasztanowa', '07-070'),
       ('Łódź', '1', '1', 'Stokłosy', '30-990'),
       ('Poznań', '32', '10', 'Mysia', '56-123');


INSERT INTO `oddam`.`roles` (`role`) VALUES
('ROLE_USER'),
('ROLE_INSTITUTION'),
('ROLE_ADMIN'),
('ROLE_SUPERADMIN');


# Admins password = admin
INSERT INTO `oddam`.`users` (`id`, `created`, `username`, `password`, `enabled`, `email`, `phone_number`,
                             `user_first_name`, `user_last_name`)
VALUES ('1', '2019-03-04 15:00:00', 'admin', '$2a$10$s3g9QrbfZv8v3cx7viNJOu4V7gcsnrz5Hzm8OqjRXjLMak7Td.42C', '1',
        'admin@main.pl', '123456789',
        'Arkadiusz', 'Kowalski'),
       ('2', '2019-03-01 11:00:00', 'admin2', '$2a$10$s3g9QrbfZv8v3cx7viNJOu4V7gcsnrz5Hzm8OqjRXjLMak7Td.42C', '1',
        'admin@second.pl',
        '123123123', 'Paweł', 'Słomiński'),
       ('3', '2019-04-04 22:00:00', 'admin3', '$2a$10$s3g9QrbfZv8v3cx7viNJOu4V7gcsnrz5Hzm8OqjRXjLMak7Td.42C', '1',
        'admin@third.pl',
        '123456788', 'John', 'Smith');


# Users password = user
INSERT INTO `oddam`.`users` (`id`, `created`, `username`, `password`, `enabled`, `email`, `phone_number`,
                             `user_first_name`, `user_last_name`)
VALUES ('4', '2019-02-04 07:00:00', 'user', '$2a$10$7zc7spg6w6U8.CKunvcsOe64CtUbo3vRH3TKbIr5sMQ8WNU68/61.', '1',
        'user@main.pl', '987654321',
        'Jarosław', 'Kowalski'),
       ('5', '2019-02-04 10:00:00', 'user2', '$2a$10$7zc7spg6w6U8.CKunvcsOe64CtUbo3vRH3TKbIr5sMQ8WNU68/61.', '1',
        'user@second.pl',
        '123443211', 'Adrian', 'Smolarek'),
       ('6', '2019-01-14 17:00:00', 'user3', '$2a$10$7zc7spg6w6U8.CKunvcsOe64CtUbo3vRH3TKbIr5sMQ8WNU68/61.', '1',
        'user@third.pl', '888777666',
        'Julie', 'Bucket');


# Institutions password = institution
INSERT INTO `oddam`.`users` (`id`, `created`, `username`, `password`, `enabled`, `email`, `institution_name`,
                             `phone_number`)
VALUES ('100', '2019-02-02 07:00:00', 'institution', '$2a$10$abBHifNBp3Spqw/u.zkJguXzE9M2hOOXZ1H8531Dn1kHRgtu8Oyi6',
        '1',
        'institution@main.pl', 'Dla Malucha', '888777666'),
       ('101', '2019-02-05 09:00:00', 'institution2', '$2a$10$abBHifNBp3Spqw/u.zkJguXzE9M2hOOXZ1H8531Dn1kHRgtu8Oyi6',
        '1',
        'institution@second.pl', 'Dla Dziadka', '123456789'),
       ('102', '2019-02-07 15:00:00', 'institution3', '$2a$10$abBHifNBp3Spqw/u.zkJguXzE9M2hOOXZ1H8531Dn1kHRgtu8Oyi6',
        '1',
        'institution@third.pl', 'Fundacja "Bez domu', '123456789');

INSERT INTO `oddam`.`users_role` (`users_id`, `role_id`)
VALUES ('1', '3'),
       ('2', '3'),
       ('3', '3'),
       ('4', '1'),
       ('5', '1'),
       ('6', '1'),
       ('100', '2'),
       ('101', '2'),
       ('102', '2');

INSERT INTO `oddam`.users_user_address (user_id, user_address_id)
VALUES ('1', '1'),
       ('2', '2'),
       ('3', '3'),
       ('4', '4'),
       ('5', '5'),
       ('6', '6');