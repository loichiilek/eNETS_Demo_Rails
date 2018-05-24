require_relative '../../lib/util/DefaultAccount'
require_relative '../../lib/util/GenerateHMAC'

class StaticPagesController < ApplicationController
  def home
    @txn_req = ""
    @hmac = ""
    @keyID = ""

    txn_amt = params['txnAmt']
    if (!txn_amt.nil?)
      if (!txn_amt.empty?)
        a = Account.new
        @txn_req = generate_payload(txn_amt)
        @hmac = generate_signature(@txn_req, a.secret_key)
        @keyID = a.public_key

        puts "txnReq= " + @txn_req
        puts "hmac= " + @hmac
        puts "public_key= " + @keyID
      end
    end
  end

  def contact
  end
end
