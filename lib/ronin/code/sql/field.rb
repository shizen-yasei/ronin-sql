#
#--
# Ronin SQL - A Ronin library providing support for SQL related security
# tasks.
#
# Copyright (c) 2007-2008 Hal Brodigan (postmodern.mod3 at gmail.com)
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
#++
#

require 'ronin/code/sql/expr'
require 'ronin/code/sql/as'
require 'ronin/code/sql/between'
require 'ronin/code/sql/asc'
require 'ronin/code/sql/desc'

module Ronin
  module Code
    module SQL
      class Field < Expr

        def initialize(program,name,prefix=nil)
          super(program)

          @prefix = prefix
          @name = name
        end

        def field(name)
          sym = symbol("#{self}.#{name}")
          sym.value ||= Field.new(@program,name,self)

          return sym
        end

        def *
          field('*')
        end

        def id
          field('id')
        end
        
        def as(name)
          As.new(@program,self,name)
        end

        def between(start,stop)
          Between.new(@program,self,start,stop)
        end

        def <=>(range)
          between(range.begin,range.end)
        end

        def asc
          Asc.new(@program,self)
        end

        def desc
          Desc.new(@program,self)
        end

        def emit
          self.to_s.to_sym
        end

        def to_s
          if @prefix
            return "#{@prefix}.#{@name}"
          else
            return "#{@name}"
          end
        end

        protected

        def method_missing(name,*arguments,&block)
          if (arguments.empty? && @prefix.nil? && block.nil?)
            return field(name)
          end

          raise(NoMethodError,sym.id2name)
        end

      end
    end
  end
end
