DROP TABLE IF EXISTS
    Verter,  XP, Tasks, Checks;

CREATE TABLE Checks (
  ID INT PRIMARY KEY NOT NULL
);

insert into checks(ID)
values (1),
       (2),
       (3),
       (4),
       (5),
       (6),
       (7),
       (8);


CREATE TABLE Verter (
  ID INT PRIMARY KEY NOT NULL,
  Check_ INT NOT NULL,
  State_ INT NOT NULL,
  Time_ TIME NOT NULL,
  FOREIGN KEY (Check_) REFERENCES Checks(ID)
);

CREATE TABLE XP (
  ID INT PRIMARY KEY NOT NULL,
  Check_ INT NOT NULL,
  XPAmount INT NOT NULL,
  FOREIGN KEY (Check_) REFERENCES Checks(ID), CHECK(XPAmount >= 0)
);

CREATE TABLE Tasks (
  Title VARCHAR(255) PRIMARY KEY NOT NULL,
  ParentTask VARCHAR(255),
  MaxXP INT NOT NULL
);

-- https://proglib.io/p/funkcii-i-hranimye-procedury-v-sql-zachem-nuzhny-i-kak-primenyat-v-realnyh-primerah-2022-10-07

CREATE OR REPLACE PROCEDURE import_csv(table_name TEXT, file_path TEXT, delimiter TEXT)
  LANGUAGE plpgsql
  AS
$$
BEGIN
  EXECUTE format('COPY %I FROM %L DELIMITER %L CSV', table_name, file_path, delimiter);
END;
$$;

CREATE OR REPLACE PROCEDURE import_csv(table_name TEXT, file_path TEXT, delimiter TEXT) AS $$
BEGIN
  EXECUTE format('COPY %I FROM %L DELIMITER %L CSV', table_name, file_path, delimiter);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE export_csv(table_name TEXT, file_path TEXT, delimiter TEXT)
  LANGUAGE plpgsql
  AS
$$
BEGIN
  EXECUTE format('COPY %I TO %L DELIMITER %L CSV', table_name, file_path, delimiter);
END;
$$;

CALL import_csv('verter', '/Users/marlinto/Desktop/SQL2_Info21_v1.0-0/src/csv/verter_import.csv', ',');
CALL export_csv('verter', '/Users/marlinto/Desktop/SQL2_Info21_v1.0-0/src/csv/verter_export.csv', ',');

CALL import_csv('xp', '/Users/marlinto/Desktop/SQL2_Info21_v1.0-0/src/csv/xp_import.csv', ',');
CALL export_csv('xp', '/Users/marlinto/Desktop/SQL2_Info21_v1.0-0/src/csv/xp_export.csv', ',');

CALL import_csv('tasks', '/Users/marlinto/Desktop/SQL2_Info21_v1.0-0/src/csv/tasks_import.csv', ',');
CALL export_csv('tasks', '/Users/marlinto/Desktop/SQL2_Info21_v1.0-0/src/csv/tasks_export.csv', ',');
