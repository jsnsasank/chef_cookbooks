name "dev"
description "This is the dev env"
cookbook "apache", "= 0.1.5"
override_attributes ( {
	"author" => {
		"name" => "shammu bujji is new author"
	}
})
