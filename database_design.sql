create table expenses (
  id serial primary key,
  amount numeric(10,2) NOT NULL DEFAULT 0.00,
  memo varchar(255) NOT NULL,
  created_on date NOT NULL DEFAULT now()
);

