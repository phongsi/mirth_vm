default[:dir][:root] = "/opt/mirthconnect"
default[:dir][:appdata] = "/opt/mirthconnect/appdata"
default[:dir][:conf] = "/opt/mirthconnect/conf"

default[:dir][:tempdata] = "temp"

default[:http][:port] = "8080"
default[:https][:port] = "8443"
default[:jmx][:port] = "1099"

default[:password][:minlength]= "0"
default[:password][:minupper] = "0"
default[:password][:minlower] = "0"
default[:password][:minnumeric] = "0"
default[:password][:minspecial] = "0"
default[:password][:retrylimit] = "0"
default[:password][:lockoutperiod] = "0"
default[:password][:expiration] = "0"
default[:password][:graceperiod] = "0"
default[:password][:reuseperiod] = "0"
default[:password][:reuselimit] = "0"

default[:http][:contextpath] = "/"
default[:server][:url] = nil
default[:jmx][:password] = "admin"

default[:http][:host] = "0.0.0.0"
default[:https][:host] = "0.0.0.0"
default[:jmx][:host] = "localhost"
default[:database][:type] = "postgres"
default[:database][:driver] = nil
default[:database][:url] = "jdbc:postgresql://localhost:5432/mirthdb"
default[:database][:username] = "mirth_user"
default[:database][:password] = "password"