module TestLinkDb  
  def reset_db
    fail('MYSQL_USER environment variable should be set') if ENV['MYSQL_USER'].nil?
    fail('MYSQL_DB environment variable should be set') if ENV['MYSQL_DB'].nil?
    mysql_passwd = ENV['MYSQL_PASSWD']
    `mysql -u #{ENV['MYSQL_USER']} #{("-p " + mysql_passwd) unless mysql_passwd.nil?} #{ENV['MYSQL_DB']} < #{File.dirname(__FILE__)}/db/testlink.sql`
  end
end
