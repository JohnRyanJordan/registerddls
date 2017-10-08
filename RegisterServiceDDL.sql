CREATE EXTENSION "uuid-ossp";

CREATE TABLE product (
  id uuid NOT NULL,
  lookupcode character varying(32) NOT NULL DEFAULT(''),
  count int NOT NULL DEFAULT(0),
  createdon timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT product_pkey PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);

CREATE INDEX ix_product_lookupcode
  ON product
  USING btree
  (lower(lookupcode::text) COLLATE pg_catalog."default");

INSERT INTO product VALUES (
       uuid_generate_v4()
     , 'lookupcode1'
     , 100
     , current_timestamp
);

INSERT INTO product VALUES (
       uuid_generate_v4()
     , 'lookupcode2'
     , 125
     , current_timestamp
);

INSERT INTO product VALUES (
       uuid_generate_v4()
     , 'lookupcode3'
     , 150
     , current_timestamp
);


CREATE TABLE employee (
  ID uuid NOT NULL,
  firstName character varying(48) NOT NULL DEFAULT(''),
  lastName character varying(48) NOT NULL DEFAULT(''),
  employeeID serial,
  active boolean NOT NULL DEFAULT TRUE,
  role text,
  manager uuid,
  password text NOT NULL,
  createdon timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT employee_pkey PRIMARY KEY (ID),
  CONSTRAINT FK_MANAGERID_employee FOREIGN KEY (manager) REFERENCES employee(ID)
) WITH (
  OIDS=FALSE
);


CREATE INDEX ix_employee_lastName
  ON employee
  USING btree
  (lower(lastName::text) COLLATE pg_catalog."default");


INSERT INTO employee VALUES (
       uuid_generate_v4()
     , 'Ryan'
     , 'Jordan'
     , DEFAULT
     , TRUE
     , 'Developer'
     , NULL
     , 12345
     , current_timestamp
);
