INSERT INTO operation_category (id, name, cashback_percent, status)
VALUES
    (991, 'FUEL', 1.5, 2),
    (992, 'RESTAURANTS', 1.7, 2),
    (993, 'ADVENTURES', 2.0, 2),
    (994, 'SPORT', 3.0, 2),
    (995, 'COMPUTER_GAMES', 1.5, 2),
    (996, 'AUTOMOBILES', 1.7, 2),
    (997, 'MEDICINE', 20.0, 4);

INSERT INTO organization (id, code, name, cashback_percent, status)
VALUES
    (991, '03931816-79bc-45b3-b145-db2e4bf3a27b', 'Yandex-Market', 1.0, 2),
    (992, '778105b4-662b-488b-9543-4f464b981908', 'Ozon', 5.0, 2),
    (993, '70e40b37-c01e-4632-8792-78c96eb5a222', 'Aviasales', 6.0, 2),
    (994, '4f8a8515-fbd0-4a8b-ab74-04f7268f6cad', 'Wildberries', 7.0, 2),
    (995, '2c88db9d-9d6f-4fcd-b6e8-e85ede92b997', 'Pyatyorochka', 20.0, 4);

INSERT INTO organization_flexible_cashback (id, organization_code, min_transaction_sum, cashback_percent)
VALUES
    (991, '03931816-79bc-45b3-b145-db2e4bf3a27b', 1000, 2.5), -- Yandex-Market
    (992, '03931816-79bc-45b3-b145-db2e4bf3a27b', 5000, 3.5), -- Yandex-Market
    (993, '03931816-79bc-45b3-b145-db2e4bf3a27b', 15000, 5); -- Yandex-Market

INSERT INTO transactions (id, bank_account_number, transaction_sum, balance_before_transaction, date, organization_code, operation_category)
VALUES
    (991, '63ebd05b-a67e-47d3-99f4-b8f7306b52cd', 5000, 100000, '2023-07-01', '03931816-79bc-45b3-b145-db2e4bf3a27b', 'FUEL'), -- DEFAULT_CARD, Yandex-Market, Fuel
    (992, 'f2dea26d-4d41-45ac-8bb6-90b7d58447ec', 5000, 100000, '2023-07-02', '778105b4-662b-488b-9543-4f464b981908', 'RESTAURANTS'), -- HIPSTER_DEFAULT, Ozon, RESTAURANTS
    (993, '5cc4ed6a-c2c7-4163-bc29-bc76c3ee9cad', 5000, 100000, '2023-07-03', '70e40b37-c01e-4632-8792-78c96eb5a222', 'ADVENTURES'), -- HIPSTER_GOLD, Aviasales, ADVENTURES
    (994, 'ea849672-5368-4014-ab74-b9639cfe747f', 5000, 100000, '2023-07-04', '4f8a8515-fbd0-4a8b-ab74-04f7268f6cad', 'SPORT'), -- HIPSTER_PLATINUM, Wildberries, SPORT
    (995, '105e50b1-4cd7-491f-8d0d-0c308968bec0', 5000, 100000, '2023-04-04', '2c88db9d-9d6f-4fcd-b6e8-e85ede92b997', 'COMPUTER_GAMES'); -- HIPSTER_BLACK, Pyatyorochka, COMPUTER_GAMES >30days
