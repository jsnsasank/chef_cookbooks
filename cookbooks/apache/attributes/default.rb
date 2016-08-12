default["apache"]["sites"]["pasha2"]   = {"site_title" => "Pasha2 Website coming soon" ,"port" =>  80, "domain" => "shammu2.mylabserver.com"}
default["apache"]["sites"]["pasha2b"] = {"site_title" => "Pasha2 B - Website coming soon" , "port" => 80, "domain" => "shammu2b.mylabserver.com"}
default["apache"]["sites"]["pasha4"] = {"site_title" => "pasha4 cetons - by chef", "port" => 80, "domain" => "shammu3.mylabserver.com" }
default["author"]["name"] = "lalpasha shaik"

case node["platform"] 
  when "centos"
    default["apache"]["package"]  = "httpd"
  when "ubuntu"
    default["apache"]["package"]  = "apache2"
end
