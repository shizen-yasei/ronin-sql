#
# Ronin SQL - A Ronin library providing support for SQL related security
# tasks.
#
# Copyright (c) 2007-2010 Hal Brodigan (postmodern.mod3 at gmail.com)
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

require 'ronin/code/sql/factory'

module Ronin
  module Code
    #
    # Creates a SQL factory.
    #
    # @param [Hash] options
    #   Encoding options.
    #
    # @return [SQL::Factory]
    #   The new SQL factory object.
    #
    # @example
    #   sql = Code.sql
    #
    #   sql[:and, 1, :eq, 1].to_s
    #   # => "and 1 = 1"
    #
    # @since 0.3.0
    #
    def Code.sql(options={})
      SQL::Factory.new(options)
    end
  end
end
