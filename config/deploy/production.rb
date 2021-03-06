# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{cap@192.168.111.22}
role :web, %w{cap@192.168.111.22}
role :db,  %w{cap@192.168.111.22}


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

#server '91.239.26.200', user: 'deploy', roles: %w{web app}, my_property: :my_value

set :nginx_server_name, 'lock.rtsystems.ru'

# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# And/or per server (overrides global)
# ------------------------------------
#server '91.239.26.200',
#   user: 'deploy',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'deploy', # overrides user setting above
#     #keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(password),
#     password: 'felix'
#   }
