# -*- encoding: utf-8 -*-
#
# Author:: Thomas Heinen (<theinen@tecracer.de>)
#
# Copyright (C) 2019, Thomas Heinen
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "kitchen"
require "kitchen/transport/ssh"
require 'pry'
module Kitchen
  module Transport
    # A Transport which uses the alternative Dropbear client for SSH
    #
    # @author Thomas Heinen <theinen@tecracer.de>
    class Dropbear < Kitchen::Transport::Ssh
      kitchen_transport_api_version 1

      plugin_version Kitchen::VERSION

      default_config :port, 22
      default_config :username, "root"

      default_config :ssh_key, nil
      expand_path_for :ssh_key

      default_config :dbclient_bin, 'dbclient'
      expand_path_for :dbclient_bin

      # A Connection instance can be generated and re-generated, given new
      # connection details such as connection port, hostname, credentials, etc.
      # This object is responsible for carrying out the actions on the remote
      # host such as executing commands, transferring files, etc.
      #
      class Connection < Kitchen::Transport::Ssh::Connection

        # (see Ssh::Connection#login_command)
        def login_command
          args  = %w{ -y -y }
          args += %w{ -A } if options.key?(:forward_agent) && options[:forward_agent] == 'yes'
          Array(options[:keys]).each { |ssh_key| args += %W{ -i #{ssh_key} } }
          args += %W{ -p #{port} }
          args += %W{ #{username}@#{hostname} }

          LoginCommand.new(options[:dbclient_bin], args)
        end
      end
    end
  end
end
