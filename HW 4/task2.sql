INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Fluffy','2020-10-15', 'vet', 'antibiotics');

INSERT INTO petPet (petname, owner, species, gender, birth, death)
VALUES ('Hammy', 'Diane','hamster','M','2020-10-30',NULL);

INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Hammy','2020-10-15','vet','antibiotics');

INSERT INTO petEvent (petname, eventdate,eventtype,remark)
VALUES ('Fluffy','1995-05-15','litter','5 kittens, 2 male, 3 female');

INSERT INTO petEvent (petname,eventdate,eventtype,remark)
VALUES ('Claws','1997-08-03','vet','broken rib');

UPDATE petPet
SET death = '2020-09-01'
WHERE petname = 'Puffball';

DELETE FROM petPet
WHERE petname = 'Buffy' AND owner = 'Harold';