
-- Table describing the operation category
CREATE TABLE IF NOT EXISTS operation_category(
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    cashback_percent DOUBLE PRECISION NOT NULL,
    status INTEGER NOT NULL,
    ts BIGINT
);

CREATE SEQUENCE IF NOT EXISTS operation_category_seq
    MINVALUE 1
    MAXVALUE 999999999
    INCREMENT BY 1
    START WITH 1;

-- Table describing organization
CREATE TABLE IF NOT EXISTS organization(
    id BIGSERIAL PRIMARY KEY,
    code UUID NOT NULL UNIQUE,
    cashback_percent DOUBLE PRECISION NOT NULL,
    status INTEGER NOT NULL,
    ts BIGINT
);

-- Table describing transaction
CREATE TABLE IF NOT EXISTS transactions(
    id BIGSERIAL PRIMARY KEY,
    bank_account_number UUID NOT NULL,
    transaction_sum DOUBLE PRECISION NOT NULL,
    balance_before_transaction DOUBLE PRECISION NOT NULL,
    client_id BIGSERIAL NOT NULL,
    date TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    organization_code UUID NOT NULL ,
    operation_category VARCHAR(255) NOT NULL,
    ts BIGINT,
    FOREIGN KEY (organization_code) REFERENCES organization(code),
    FOREIGN KEY (operation_category) REFERENCES operation_category(name)
);

DELETE FROM operation_category;
DELETE FROM organization;
DELETE FROM transactions;