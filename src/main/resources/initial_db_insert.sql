INSERT INTO `oddam`.`categories` (`name`) VALUES
('ubrania, które nadają się do ponownego użycia'),
('ubrania, do wyrzucenia'),
('zabawki'),
('książki'),
('inne');

INSERT INTO `oddam`.`roles` (`role`) VALUES
('ROLE_USER'),
('ROLE_INSTITUTION'),
('ROLE_ADMIN'),
('ROLE_SUPERADMIN');

INSERT INTO `oddam`.`users` (`id`, `username`, `password`, `enabled`, `phone_number`)
VALUES ('1', 'admin', '$2a$10$s3g9QrbfZv8v3cx7viNJOu4V7gcsnrz5Hzm8OqjRXjLMak7Td.42C', '1', '123456789'),
       ('2', 'user', '$2a$10$7zc7spg6w6U8.CKunvcsOe64CtUbo3vRH3TKbIr5sMQ8WNU68/61.', '1', '987654321');

INSERT INTO `oddam`.`users_role` (`users_id`, `role_id`)
VALUES ('1', '3'),
       ('2', '1');
