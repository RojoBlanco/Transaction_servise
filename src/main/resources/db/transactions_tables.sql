
--Custom data type
--How to use: https://www.postgresql.org/docs/current/datatype-enum.html
CREATE TYPE contribution_status AS ENUM ('APPROVED', 'CREATED', 'DECLINED');

-- Table describing the operation category
CREATE TABLE IF NOT EXISTS operation_category(
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    cashback_percent DOUBLE PRECISION NOT NULL,
    status contribution_status NOT NULL
);

-- Table describing organization
CREATE TABLE IF NOT EXISTS organisation(
    id BIGSERIAL PRIMARY KEY,
    code UUID NOT NULL UNIQUE,
    cashback_percent DOUBLE PRECISION NOT NULL,
    status contribution_status NOT NULL
);

-- Table describing transaction
CREATE TABLE IF NOT EXISTS transactions(
    id BIGSERIAL PRIMARY KEY,
    bank_account_number UUID NOT NULL UNIQUE,
    transaction_sum DOUBLE PRECISION NOT NULL,
    balance_before_transaction DOUBLE PRECISION NOT NULL,
    client_id BIGSERIAL NOT NULL,
    date TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    organisation_code UUID NOT NULL ,
    operation_category VARCHAR(255) NOT NULL,
    FOREIGN KEY (organisation_code) REFERENCES organisation(code),
    FOREIGN KEY (operation_category) REFERENCES operation_category(name)
);