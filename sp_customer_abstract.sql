create procedure sp_customer_abstract()
  returns string not null
  language javascript
  as
  -- "$$" is the delimiter for the beginning and end of the stored procedure.
  $$
  // The "snowflake" object is provided automatically in each stored procedure.
  // You don't need to create it.
  //         |||||||||
  //         vvvvvvvvv
  var statement = snowflake.createStatement('select 1000');
  ...
  $$
  ;