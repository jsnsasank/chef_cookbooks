name "database"
description "mysql db servers"
run_list "role[base]", "recipe[mysql]"
