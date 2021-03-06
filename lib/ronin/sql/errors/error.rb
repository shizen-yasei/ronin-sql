#
# Ronin SQL - A Ronin library providing support for SQL related security
# tasks.
#
# Copyright (c) 2007-2009 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

module Ronin
  module SQL
    module Errors
      class Error

        # The URL which is vulnerable
        attr_reader :url

        # The vulnerable query param
        attr_accessor :param

        # SQL error type
        attr_reader :type

        # SQL Dialect
        attr_reader :dialect

        # SQL error message
        attr_reader :message

        #
        # Creates a new SQL Error object with the specified _type_, 
        # _dialect_ and _message_.
        #
        def initialize(type,dialect,message)
          @type = type
          @dialect = dialect
          @message = message
        end

        #
        # Returns the message in String form.
        #
        def to_s
          @message.to_s
        end

      end
    end
  end
end
