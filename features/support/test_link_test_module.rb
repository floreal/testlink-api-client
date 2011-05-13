#    This file is part of testlink-api-client.
#
#    testlink-api-client is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    testlink-api-client is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with Foobar.  If not, see <http://www.gnu.org/licenses/>.

module TestLinkTestModule
  def reset_db
    fail('MYSQL_USER environment variable should be set') if ENV['MYSQL_USER'].nil?
    fail('MYSQL_DB environment variable should be set') if ENV['MYSQL_DB'].nil?
    mysql_passwd = ENV['MYSQL_PASSWD']
    `mysql -u #{ENV['MYSQL_USER']} #{("-p " + mysql_passwd) unless mysql_passwd.nil?} #{ENV['MYSQL_DB']} < #{File.dirname(__FILE__)}/db/testlink.sql`
  end

  def string2boolean str
    case str
      when 'true', '1', 'yes', 'ok'
        true
      else
        false
    end
  end
end
