CREATE TABLE IF NOT EXISTS validators (
	validator_pubkey    VARCHAR(98) NOT NULL PRIMARY KEY,
    status              INTEGER NOT NULL,
    report_count        INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS builder_block_submissions (
	id                        VARCHAR(32) PRIMARY KEY,
    inserted_at               TIMESTAMP NOT NULL default current_timestamp,
    slot                      BIGINT NOT NULL,
    builder_pubkey            VARCHAR(98) NOT NULL,
    builder_signature         VARCHAR(48) NOT NULL,
	rpbs				      TEXT NOT NULL,
    transaction_byte          TEXT NOT NULL
);
CREATE KEY idx_builder builder_block_submissions(builder_pubkey);
CREATE KEY idx_slot builder_block_submissions(slot);
CREATE KEY idx_builder_slot builder_block_submissions(builder_pubkey, slot);

CREATE TABLE IF NOT EXISTS validator_payloads_delivered (
	id                    BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    inserted_at           TIMESTAMP NOT NULL default current_timestamp,
    slot                  BIGINT NOT NULL,
	proposer_pubkey       varchar(98) NOT NULL,
    block_hash            varchar(66) NOT NULL,
    payload 	          json NOT NULL
   
);
CREATE KEY idx_slot_proposer validator_payloads_delivered(slot, proposer_pubkey);

CREATE TABLE IF NOT EXISTS validator_returned_blocks (
	id                  BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	inserted_at 	    TIMESTAMP NOT NULL DEFAULT current_timestamp,
	signature           VARCHAR(48) NOT NULL,
	block_hash 		    VARCHAR(66) NOT NULL,
	proposer_pubkey     VARCHAR(98) NOT NULL,
	slot        	    BIGINT NOT NULL
);
CREATE KEY idx_slot validator_returned_blocks(slot);

CREATE TABLE IF NOT EXISTS validator_header_delivered (
	id                          BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	inserted_at                 TIMESTAMP NOT NULL default current_timestamp,
    slot                        BIGINT NOT NULL,
	proposer_pubkey             VARCHAR(98) NOT NULL,
    block_hash                  VARCHAR(98) NOT NULL,
	value                       BIGINT
);
CREATE KEY idx_slot validator_header_delivered(slot);
CREATE KEY idx_slot_proposer validator_header_delivered(proposer_pubkey);

CREATE TABLE IF NOT EXISTS block_builders(
	builder_pubkey      VARCHAR(98) NOT NULL PRIMARY KEY,
	status    	        INTEGER NOT NULL
);
CREATE KEY idx_status block_builders(status);

CREATE TABLE IF NOT EXISTS reporters (
    reporter_pubkey     varchar(98) NOT NULL PRIMARY KEY,
	active    	        BOOLEAN NOT NULL,
	report_count        INTEGER NOT NULL
);

