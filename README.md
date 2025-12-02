
Before you begin:

1) This requires Docker Desktop
2) It's recommended to run this in VS Code. 
3) This will not work on GCP regions because of the way GCP resolves DNS.
4) If you have an active network policy, you will need to add the IP address of snowpark container service to your ingress network rule. 
5) This has been tested on AWS East, I am not sure about Azure but it should work there too.
6) You will need a network policy (0.0.0.0/0 is to allow all)
7) You will need to login via docker to push, this can be done with PAT (Programatic Access Tokens)


Instructions:
1) Login to your snowflake account
2) Ensure you have a network rule
3) Run Script 01_setup.sql
4) Generate a private/public key pair and add it to the METABASE_SERVICE_USER in 02_setup_stages.sql
5) Modify your network rule in 03_create_rules_and_access.sql properly to your desired configuration.
6) Run Script 03_setup.sql
7) Replace the docker_commands.txt XXXXXXX-XXXXXXX to what account identifier (https://docs.snowflake.com/en/user-guide/admin-account-identifier) which for AWS is Data sharing account identifier in account details section. Some regions may use account locator. 
8) Run the docker commands in docker_commands.txt
9) Replace the docker_commands.txt XXXXXXX-XXXXXXX to what account identifier in metabase.yml
10) Upload, using the UI, the metabase.yml file to the stage METABASE_DB.PUBLIC.SPECS
11) Run the 04_create_service.sql command
12) Ensure that the services are up using commands in the 05_view_services.sql file
13) The show endpoints command in the 5_view_services.sql file is where you login
14) Connect with snowflake using your account identifier and the private key you have, with the proper warehouses we setup,users, and roles. 
15) You should be all connected. If you want to suspend the service, take a look at 09_optional_alters.sql


Let me know if you have any issues or corrections to this and I will change.