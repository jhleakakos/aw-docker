Instructions for setting up AdventureWorks in Docker on macOS.

Reference pages:

- [AdventureWorks DB](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms)
- [Deploy Container](https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-docker-container-deployment?view=sql-server-ver16&pivots=cs1-bash)
- [Deploy Quickstart](https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver15&preserve-view=true&pivots=cs1-bash)
- [Connect with Azure Data Studio](https://learn.microsoft.com/en-us/sql/azure-data-studio/quickstart-sql-server?view=sql-server-ver16)

Instructions for running container:

- download AdventureWorks2019.bak
- pull docker image: `docker pull mcr.microsoft.com/mssql/server:2019-latest`
- create a .env file in project root with a password for the MSSQL_PWD variable
- run `docker compose up -d` to run the container
- when finished, run `docker compose down` to stop the container

If you prefer to use `docker container run` instead of `docker compose`:

- basic `run` command: `docker container run --name aw -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=yourStrong(!)Password" -p 1433:1433 -d mcr.microsoft.com/mssql/server:2022-latest`