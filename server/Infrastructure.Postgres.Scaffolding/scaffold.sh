#!/bin/bash
#the below will read the the CONN_STR from .env file - you may change this to your connection string
set -a
source .env
set +a

dotnet ef dbcontext scaffold "Host=localhost;Port=5400;Database=medicaredb;Username=medicareuser;Password=medicarepass"   Npgsql.EntityFrameworkCore.PostgreSQL  --output-dir ../Core.Domain/Entities   --context-dir .   --context MyDbContext --no-onconfiguring  --namespace Core.Domain.Entities --context-namespace  Infrastructure.Postgres.Scaffolding --schema public --force 

