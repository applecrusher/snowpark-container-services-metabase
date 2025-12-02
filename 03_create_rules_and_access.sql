
USE ROLE METABASE_SERVICE_ROLE;


USE DATABASE METABASE_DB;

--You can make this specific to your snowflake connection you want to make
--The connection should be something like XXXXXXX-XXXXXXX.snowflakecomputing.com
--You only need access to port 443 metabase
CREATE OR REPLACE NETWORK RULE METABASE_NETWORK_RULE
  MODE = EGRESS
  TYPE = HOST_PORT
  VALUE_LIST = (
    '0.0.0.0:443'
  );

CREATE EXTERNAL ACCESS INTEGRATION METABASE_EXTERNAL_ACCESS
ALLOWED_NETWORK_RULES = ( METABASE_NETWORK_RULE )
ENABLED = TRUE;




--You may need to add this if you get permission issues
USE ROLE ACCOUNTADMIN;

GRANT USAGE ON DATABASE metabase_db TO ROLE METABASE_SERVICE_ROLE;

GRANT USAGE ON ALL SCHEMAS IN DATABASE metabase_db TO ROLE METABASE_SERVICE_ROLE;





