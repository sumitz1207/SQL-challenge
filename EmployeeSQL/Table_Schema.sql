create table "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    constraint "pk_departments" primary key (
        "dept_no"
     )
);

create table "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    constraint "pk_dept_emp" primary key (
        "emp_no","dept_no"
     )
);

create table "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL,
    constraint "pk_dept_manager" primary key (
        "emp_no"
     )
);

create table "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" date   NOT NULL,
    constraint "pk_employees" primary key (
        "emp_no"
     )
);

create table "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    constraint "pk_salaries" primary key (
        "emp_no"
     )
);

create table "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    constraint "pk_titles" primary key (
        "title_id"
     )
);

alter table "dept_emp" add constraint "fk_dept_emp_emp_no" foreign key("emp_no")
references "employees" ("emp_no");

alter table "dept_emp" add constraint "fk_dept_emp_dept_no" foreign key("dept_no")
references "departments" ("dept_no");

alter table "dept_manager" add constraint "fk_dept_manager_dept_no" foreign key("dept_no")
references "departments" ("dept_no");

alter table "dept_manager" add constraint "fk_dept_manager_emp_no" foreign key("emp_no")
references "employees" ("emp_no");

alter table "employees" add constraint "fk_employees_emp_title_id" foreign key("emp_title_id")
references "titles" ("title_id");

alter table "salaries" add constraint "fk_salaries_emp_no" foreign key("emp_no")
references "employees" ("emp_no");