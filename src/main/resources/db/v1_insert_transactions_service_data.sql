INSERT INTO operation_category (name, cashback_percent, status)
VALUES
    ('FUEL', 1.5, 2),
    ('RESTAURANTS', 1.7, 2),
    ('ADVENTURES', 2.0, 2),
    ('SPORT', 3.0, 2),
    ('COMPUTER_GAMES', 1.5, 2),
    ('AUTOMOBILES', 1.7, 2),
    ('MEDICINE', 2.0, 2);

INSERT INTO organization (code, name, cashback_percent, status)
VALUES
    ('03931816-79bc-45b3-b145-db2e4bf3a27b', 'Yandex-Market', 1.0, 2),
    ('778105b4-662b-488b-9543-4f464b981908', 'Ozon', 5.0, 2),
    ('70e40b37-c01e-4632-8792-78c96eb5a222', 'Aviasales', 6.0, 2),
    ('4f8a8515-fbd0-4a8b-ab74-04f7268f6cad', 'Wildberries', 7.0, 2),
    ('2c88db9d-9d6f-4fcd-b6e8-e85ede92b997', 'Pyatyorochka', 8.0, 2);

INSERT INTO organization_flexible_cashback (organization_code, min_transaction_sum, cashback_percent)
VALUES
    ('03931816-79bc-45b3-b145-db2e4bf3a27b', 1000, 2.5),
    ('03931816-79bc-45b3-b145-db2e4bf3a27b', 5000, 3.5),
    ('03931816-79bc-45b3-b145-db2e4bf3a27b', 15000, 5);

INSERT INTO transactions (id, bank_account_number, transaction_sum, balance_before_transaction, date, organization_code, operation_category)
VALUES
    (991, '63ebd05b-a67e-47d3-99f4-b8f7306b52cd', 5000, 100000, '2023-07-01', '03931816-79bc-45b3-b145-db2e4bf3a27b', 'FUEL'); -- DEFAULT_CARD, Yandex-Market, Fuel
