name "webserver"
description "Apache web server Role"
run_list "role[base]", "recipe[apache]"
