require 'openssl'
require 'bcrypt'

module EncryptText
  KEY = ENV["message_key"]
  KEY32 = ENV["message_key_32"]
  ALGORITHM = ENV["algorithm"]

  def self.encrypt(message, password, iv)
    cipher=OpenSSL::Cipher.new(ALGORITHM)
    cipher.encrypt()
    if password.nil?
      cipher.key = KEY32
    else
      cipher.key = self.digest_password(self.decrypt_key(password))
    end
    cipher.iv = iv
    crypt = cipher.update(message) + cipher.final()
    crypt_string = (Base64.encode64(crypt))
    return crypt_string
  end

# returns encrypted key to store in user's sessions
  def self.encrypt_key(key)
    cipher=OpenSSL::Cipher.new(ALGORITHM)
    cipher.encrypt()
    cipher.key=KEY32 #encrypt with my key + random
    crypt = cipher.update(key) + cipher.final()
    crypt_string = (Base64.encode64(crypt))
    return crypt_string
  end

# decrypts key to be used
  def self.decrypt_key(key)
    cipher=OpenSSL::Cipher.new(ALGORITHM)
    cipher.decrypt()
    cipher.key = KEY32
    tempkey = Base64.decode64(key)
    crypt = cipher.update(tempkey)
    crypt << cipher.final()
    return crypt
  end

  #make random IV
  def self.make_iv
    SecureRandom.random_bytes(32)
  end

  #turn password into 256 bit
  def self.digest_password(password)
    OpenSSL::Digest::SHA256.new(password).digest
  end

  def self.decrypt(message, password, iv)
    cipher=OpenSSL::Cipher.new(ALGORITHM)
    cipher.decrypt()
    if password.nil?
      cipher.key = KEY32
    else
      cipher.key = self.digest_password(self.decrypt_key(password))
    end
    cipher.iv = iv
    tempkey = Base64.decode64(message)
    crypt = cipher.update(tempkey)
    crypt << cipher.final()
    return crypt
  end
end