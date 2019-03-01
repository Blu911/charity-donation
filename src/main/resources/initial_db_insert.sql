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
# Users password = user
INSERT INTO `oddam`.`users` (`id`, `username`, `password`, `enabled`, `email`, `phone_number`, `user_first_name`,
                             `user_last_name`)
VALUES ('1', 'admin', '$2a$10$s3g9QrbfZv8v3cx7viNJOu4V7gcsnrz5Hzm8OqjRXjLMak7Td.42C', '1', 'admin@main.pl', '123456789',
        'Arkadiusz', 'Kowalski'),
       ('2', 'user', '$2a$10$7zc7spg6w6U8.CKunvcsOe64CtUbo3vRH3TKbIr5sMQ8WNU68/61.', '1', 'user@main.pl', '987654321',
        'Jarosław', 'Kowalski'),
       ('3', 'admin2', '$2a$10$s3g9QrbfZv8v3cx7viNJOu4V7gcsnrz5Hzm8OqjRXjLMak7Td.42C', '1', 'admin@second.pl',
        '123123123', 'Paweł', 'Słomiński'),
       ('4', 'admin3', '$2a$10$s3g9QrbfZv8v3cx7viNJOu4V7gcsnrz5Hzm8OqjRXjLMak7Td.42C', '1', 'admin@third.pl',
        '123456788', 'John', 'Smith'),
       ('5', 'user2', '$2a$10$7zc7spg6w6U8.CKunvcsOe64CtUbo3vRH3TKbIr5sMQ8WNU68/61.', '1', 'user@second.pl',
        '123443211', 'Adrian', 'Smolarek'),
       ('6', 'user3', '$2a$10$7zc7spg6w6U8.CKunvcsOe64CtUbo3vRH3TKbIr5sMQ8WNU68/61.', '1', 'user@third.pl', '888777666',
        'Julie', 'Bucket');

INSERT INTO `oddam`.`users_role` (`users_id`, `role_id`)
VALUES ('1', '3'),
       ('2', '1'),
       ('3', '3'),
       ('4', '3'),
       ('5', '1'),
       ('6', '1');

INSERT INTO `oddam`.users_user_address (user_id, user_address_id)
VALUES ('1', '1'),
       ('2', '2'),
       ('3', '3'),
       ('4', '4'),
       ('5', '5'),
       ('6', '6');