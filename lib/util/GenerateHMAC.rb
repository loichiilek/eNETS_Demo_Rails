require 'Base64'
require 'openssl'

def generate_signature(txn_req, secret_key)
  concat_txn_req_secret_key = txn_req+secret_key
  hash = Digest::SHA256.digest(concat_txn_req_secret_key.encode('utf-8'))
  encoded = Base64.encode64(hash)
  return encoded.to_s
end
