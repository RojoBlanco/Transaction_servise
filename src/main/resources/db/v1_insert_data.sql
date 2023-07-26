INSERT INTO operation_category (name, cashback_percent, status)
VALUES
    ('FUEL', 1.5, 1),
    ('RESTAURANTS', 1.7, 2),
    ('ADVENTURES', 2.0, 4),
    ('SPORT', 3.0, 2);

INSERT INTO organization (code, cashback_percent, status)
VALUES
    ('63ebd05b-a67e-47d3-99f4-b8f7306b52cd', 5.0, 1), --DEFAULT_CARD
    ('f2dea26d-4d41-45ac-8bb6-90b7d58447ec', 10.0, 2), --HIPSTER_DEFAULT
    ('5cc4ed6a-c2c7-4163-bc29-bc76c3ee9cad', 6.0, 3),--HIPSTER_GOLD
    ('ea849672-5368-4014-ab74-b9639cfe747f', 6.0, 4),--HIPSTER_PLATINUM
    ('105e50b1-4cd7-491f-8d0d-0c308968bec0', 5.0, 4); --HIPSTER_BLACK

INSERT INTO transactions (bank_account_number, transaction_sum, balance_before_transaction, date, organization_code, operation_category)
VALUES
    ('63ebd05b-a67e-47d3-99f4-b8f7306b52cd', 100, 100, '2023-07-01', '63ebd05b-a67e-47d3-99f4-b8f7306b52cd', 'FUEL'), --DEFAULT_CARD
    ('f2dea26d-4d41-45ac-8bb6-90b7d58447ec', 100, 100, '2023-07-02', 'f2dea26d-4d41-45ac-8bb6-90b7d58447ec', 'RESTAURANTS'), --HIPSTER_DEFAULT
    ('5cc4ed6a-c2c7-4163-bc29-bc76c3ee9cad', 100, 100, '2023-07-03', '5cc4ed6a-c2c7-4163-bc29-bc76c3ee9cad', 'ADVENTURES'),--HIPSTER_GOLD
    ('ea849672-5368-4014-ab74-b9639cfe747f', 100, 100, '2023-07-04', 'ea849672-5368-4014-ab74-b9639cfe747f', 'FUEL'), --HIPSTER_PLATINUM
    ('105e50b1-4cd7-491f-8d0d-0c308968bec0', 100, 100, '2022-07-05', '105e50b1-4cd7-491f-8d0d-0c308968bec0', 'FUEL'), --HIPSTER_BLACK
    ('63ebd05b-a67e-47d3-99f4-b8f7306b52cd', 100, 100, '2023-07-06', '63ebd05b-a67e-47d3-99f4-b8f7306b52cd', 'FUEL'), --DEFAULT_CARD
    ('f2dea26d-4d41-45ac-8bb6-90b7d58447ec', 100, 100, '2023-07-07', 'f2dea26d-4d41-45ac-8bb6-90b7d58447ec', 'RESTAURANTS'), --HIPSTER_DEFAULT
    ('5cc4ed6a-c2c7-4163-bc29-bc76c3ee9cad', 100, 100, '2023-07-08', '5cc4ed6a-c2c7-4163-bc29-bc76c3ee9cad', 'ADVENTURES'),--HIPSTER_GOLD
    ('ea849672-5368-4014-ab74-b9639cfe747f', 100, 100, '2023-07-09', 'ea849672-5368-4014-ab74-b9639cfe747f', 'FUEL'), --HIPSTER_PLATINUM
    ('105e50b1-4cd7-491f-8d0d-0c308968bec0', 100, 100, '2022-07-10', '105e50b1-4cd7-491f-8d0d-0c308968bec0', 'FUEL'); --HIPSTER_BLACK



