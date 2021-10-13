class User < ApplicationRecord
    self.table_name = "user"

    def encrypt
        self.password = BCrypt::Password.create(self.password)
    end

    def verify()
        BCrypt::Password.new(self.password)
    end
end