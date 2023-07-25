INSERT INTO operation_category (name, cashback_percent, status)
VALUES
    ('Groceries', 5.0, 'APPROVED'),
    ('Electronics', 2.5, 'APPROVED'),
    ('Fashion', 3.0, 'APPROVED'),
    ('Home & Garden', 4.0, 'CREATED'),
    ('Health & Beauty', 2.0, 'APPROVED'),
    ('Books & Stationery', 1.5, 'APPROVED'),
    ('Toys & Games', 2.0, 'DECLINED'),
    ('Sports & Outdoors', 3.5, 'APPROVED'),
    ('Automotive', 2.0, 'APPROVED'),
    ('Jewelry', 2.5, 'APPROVED');


INSERT INTO organisation (code, cashback_percent, status)
VALUES
    ('11111111-1111-1111-1111-111111111111', 5.0, 'APPROVED'),
    ('22222222-2222-2222-2222-222222222222', 3.5, 'APPROVED'),
    ('33333333-3333-3333-3333-333333333333', 2.0, 'DECLINED'),
    ('44444444-4444-4444-4444-444444444444', 4.0, 'APPROVED'),
    ('55555555-5555-5555-5555-555555555555', 3.0, 'APPROVED'),
    ('66666666-6666-6666-6666-666666666666', 2.5, 'APPROVED'),
    ('77777777-7777-7777-7777-777777777777', 1.5, 'APPROVED'),
    ('88888888-8888-8888-8888-888888888888', 2.0, 'CREATED'),
    ('99999999-9999-9999-9999-999999999999', 3.0, 'APPROVED'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 4.5, 'APPROVED');


INSERT INTO transactions (bank_account_number, transaction_sum, balance_before_transaction, client_id, date, organisation_code, operation_category)
VALUES
    ('11111111-1111-1111-1111-111111111111', 100.50, 5000.00, 1, '2023-07-01 12:30:00', '11111111-1111-1111-1111-111111111111', 'Groceries'),
    ('22222222-2222-2222-2222-222222222222', 75.25, 2000.00, 2, '2023-07-02 14:45:00', '44444444-4444-4444-4444-444444444444', 'Electronics'),
    ('33333333-3333-3333-3333-333333333333', 50.00, 3000.00, 3, '2023-07-03 09:00:00', '55555555-5555-5555-5555-555555555555', 'Fashion'),
    ('44444444-4444-4444-4444-444444444444', 200.00, 15000.00, 4, '2023-07-04 18:20:00', '66666666-6666-6666-6666-666666666666', 'Home & Garden'),
    ('55555555-5555-5555-5555-555555555555', 30.75, 500.00, 5, '2023-07-05 21:10:00', '77777777-7777-7777-7777-777777777777', 'Health & Beauty'),
    ('66666666-6666-6666-6666-666666666666', 20.90, 1000.00, 6, '2023-07-06 15:05:00', '88888888-8888-8888-8888-888888888888', 'Books & Stationery'),
    ('77777777-7777-7777-7777-777777777777', 45.00, 2500.00, 7, '2023-07-07 10:30:00', '99999999-9999-9999-9999-999999999999', 'Toys & Games'),
    ('88888888-8888-8888-8888-888888888888', 80.60, 8000.00, 8, '2023-07-08 13:55:00', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Sports & Outdoors'),
    ('99999999-9999-9999-9999-999999999999', 150.00, 7500.00, 9, '2023-07-09 16:40:00', '11111111-1111-1111-1111-111111111111', 'Automotive'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 120.25, 6000.00, 10, '2023-07-10 11:20:00', '44444444-4444-4444-4444-444444444444', 'Jewelry');