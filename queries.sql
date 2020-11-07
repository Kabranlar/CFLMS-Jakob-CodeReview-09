-- 1) How many mail was sent?

SELECT COUNT(mail.mail_id) AS 'mail sent' FROM mail WHERE EXISTS(SELECT mail.deposit_date FROM mail);

-- 2) How much mail was sent from Berlin?

SELECT COUNT(sender.sender_id) AS 'mail sent from Berlin' FROM sender
INNER JOIN address ON sender.fk_address_id = address.address_id
WHERE address.city = 'Berlin';

-- 3) Who sent mail on 2019-09-09?

SELECT mail.deposit_date, person.firstName, person.lastName from mail
INNER JOIN sender ON mail.fk_sender_id = sender.sender_id
INNER JOIN person ON sender.fk_person_id = person.person_id
WHERE mail.deposit_date = '2019-09-09';

-- 4) Who sent mail between 2019-01-01 and 2019-12-31?

SELECT mail.deposit_date, person.firstName, person.lastName from mail
INNER JOIN sender ON mail.fk_sender_id = sender.sender_id
INNER JOIN person ON sender.fk_person_id = person.person_id
WHERE mail.deposit_date BETWEEN '2019-01-01' AND '2019-12-31';

-- 5) Who sent mail between 2019-01-01 and 2019-12-31 and from where?

SELECT mail.deposit_date, person.firstName, person.lastName, address.country AS 'Country of origin' from mail
INNER JOIN sender ON mail.fk_sender_id = sender.sender_id
INNER JOIN address ON sender.fk_address_id = address.address_id
INNER JOIN person ON sender.fk_person_id = person.person_id
WHERE mail.deposit_date BETWEEN '2019-01-01' AND '2019-12-31';

-- 6) Who sent a letter to Hertha Hummel?

SELECT * FROM person WHERE person.person_id
IN(SELECT person.person_id FROM person WHERE person.person_id
IN(SELECT sender.fk_person_id FROM sender WHERE sender.sender_id
IN(SELECT sender.sender_id FROM sender WHERE sender.sender_id
IN(SELECT mail.fk_sender_id FROM mail WHERE mail.fk_recipient_id
IN(SELECT mail.fk_recipient_id FROM mail WHERE mail.fk_recipient_id
IN(SELECT recipient.recipient_id FROM recipient WHERE recipient.fk_person_id
IN(SELECT person.person_id FROM person WHERE person.firstName = 'Hertha' AND person.lastName = 'Hummel')))))));