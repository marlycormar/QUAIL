/*
name get_forms

gets form names
*/
SELECT DISTINCT instrument_name FROM meta.instruments;

/*
name get_form_data

gets the data for a particular form.
*/
SELECT * FROM "data.{{form}}";

/*
name get_columns

gets the cols for a table
*/
SELECT * FROM "{{form}}";

/*
name make_views

makes views based on select statements
takes a view_select a list of tuples of the form
(viewname, select_statement)
*/
{% for view, select in view_select %}
DROP VIEW "{{view}}";
CREATE VIEW "data.{{view}}" AS
{{select}};
{% endfor %}


/*
name multijoin_all

writes a select with a bunch of tables joined on an index
takes:
main_table
join_col
join_tables
*/
SELECT * from "{{main_table}}"
{%- for table in join_tables %}
JOIN "{{table}}" ON "{{main_table}}.{{join_col}}"
{% endfor %};
