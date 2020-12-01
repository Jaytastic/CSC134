INSERT INTO Publisher VALUES ('1234567890', 'Richard', '123 Oak Street', '0987654321');

INSERT INTO Publisher VALUES ('1111111111', 'Marini', '100 Clayton Road', '1916432113');

INSERT INTO Customer VALUES ('123456789', 'John', '111 One Street');

INSERT INTO Orders VALUES ('000000000', '2020-11-11', '123456789');

INSERT INTO Book VALUES ('2222222222', 'Hunger Game', 'Fiction', '12.22', '2011-10-29', '1234567890');

INSERT INTO Order_book VALUES ('000000000', '2222222222', 1);

INSERT INTO Author VALUES ('1234', 'Tim', 'Jackson');

INSERT INTO Written_by VALUES ('2222222222', '1234');

INSERT INTO Editor VALUES ('4072', 'Joe', 'Doe');

INSERT INTO Edited_by VALUES ('4072', '2222222222');

DELETE FROM Publisher
WHERE phone = '1916432113';

UPDATE Book
SET btype = 'horror'
WHERE title = 'Hunger Game';