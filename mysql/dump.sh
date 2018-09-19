#!/bin/bash
docker exec -i lemp_mariadb mysql -uroot -proot_db --database=que-udh < database/que-udh.sql