INSERT INTO UserCM(username, nama, email, userPassword, beratBadan, tinggiBadan, umur, gender)
VALUES	('user1', 'John Doe', 'john@example.com', 'password1', 70, 175, 30, 'Pria'),
		('user2', 'Jane Smith', 'jane@example.com', 'password2', 60, 160, 25, 'Wanita'),
		('user3', 'Bob Johnson', 'bob@example.com', 'password3', 85, 182, 35, 'Pria'),
		('user4', 'Alice Brown', 'alice@example.com', 'password4', 52, 158, 28, 'Wanita'),
		('user5', 'Mike Wilson', 'mike@example.com', 'password5', 73, 177, 32, 'Pria');

INSERT INTO Data_BMI(idData_BMI, username, targetUser,skorBMI, levelBMI)
VALUES	(1, 'user1', 60, 22.86, 'Normal'),
		(2, 'user2', 55, 23.44, 'Normal'),
		(3, 'user3', 75, 25.66, 'Overweight'),
		(4, 'user4', 61, 20.83, 'Normal'),
		(5, 'user5', 77, 23.3, 'Normal');

INSERT INTO Asupan(idAsupan, username, namaAsupan, tipeMakMin, kalori, lemak, protein, karbohidrat)
VALUES	(1, 'user1', 'Nasi Goreng', 'Makanan', 300.0, 10.0, 15.0, 35.0),
		(2, NULL, 'Pizza Pepperoni', 'Makanan', 450.0, 20.0, 25.0, 50.0),
		(3, 'user3', 'Es Teh Manis', 'Minuman', 150.0, 5.0, 2.0, 35.0),
		(4, NULL, 'Sushi Salmon', 'Makanan', 400.0, 15.0, 20.0, 55.0),
		(5, 'user5', 'Jus Jeruk', 'Minuman', 200.0, 0.5, 3.0, 45.0),
		(6, 'user1', 'Ayam Goreng', 'Makanan', 350.0, 12.0, 18.0, 40.0),
		(7, NULL, 'Burger Cheese', 'Makanan', 500.0, 22.0, 30.0, 48.0),
		(8, 'user3', 'Kopi Hitam', 'Minuman', 120.0, 3.0, 1.0, 30.0),
		(9, NULL, 'Spaghetti Bolognese', 'Makanan', 420.0, 16.0, 22.0, 60.0),
		(10, NULL, 'Soda Cola', 'Minuman', 180.0, 0.8, 4.0, 40.0);


INSERT INTO Asupan_harian(idAsupanHarian, username, limitHarian)
VALUES	(1, 'user1', 2400),
		(2, 'user2', 1800),
		(3, 'user3', 2200),
		(4, 'user4', 2200),
		(5, 'user5', 3000);

INSERT INTO List_Asupan(idAsupanHarian,idAsupan,waktu)
VALUES	(1, 6, '2023-11-02 11:00:00'),
		(1, 1, '2023-11-02 17:00:00'),
        (2, 10, '2023-11-02 18:12:00'),
        (3, 3, '2023-11-02 18:56:00'),
        (3, 4, '2023-11-02 18:45:00'),
        (3, 8, '2023-11-02 19:00:00'),
        (4, 2, '2023-11-02 23:50:00'),
        (5, 5, '2023-11-02 05:00:00'),
        (5, 7, '2023-11-02 06:00:00'),
        (5, 10, '2023-11-02 07:00:00')