class Account

  def initialize
    @UMID = "UMID_877772003"
    @public_key = "154eb31c-0f72-45bb-9249-84a1036fd1ca"
    @secret_key = "38a4b473-0295-439d-92e1-ad26a8c60279"
  end

  attr_reader :UMID
  attr_reader :public_key
  attr_reader :secret_key

end

def generate_payload(txnAmt)
  time = Time.new
  merchantTxnRef = time.inspect[0..-7].tr('-','').tr(':','') + time.usec.to_s[0..-4]
  merchantTxnDtm = time.inspect[0..-7].tr('-','') + "." + time.usec.to_s[0..-4]
  umid = "UMID_877772003"
  txn_req = "{\"ss\":\"1\",\"msg\":{\"netsMid\":\""+umid+"\",\"tid\":\"\",\"submissionMode\":\"B\",\"txnAmount\":\""+txnAmt+"\",\"merchantTxnRef\":\""+merchantTxnRef+"\",\"merchantTxnDtm\":\""+merchantTxnDtm+"\",\"paymentType\":\"SALE\",\"currencyCode\":\"SGD\",\"paymentMode\":\"\",\"merchantTimeZone\":\"+8:00\",\"b2sTxnEndURL\":\"https://sit2.enets.sg/MerchantApp/sim/b2sTxnEndURL.jsp\",\"b2sTxnEndURLParam\":\"\",\"s2sTxnEndURL\":\"https://sit2.enets.sg/MerchantApp/rest/s2sTxnEnd\",\"s2sTxnEndURLParam\":\"\",\"clientType\":\"W\",\"supMsg\":\"\",\"netsMidIndicator\":\"U\",\"ipAddress\":\"127.0.0.1\",\"language\":\"en\"}}"

  return txn_req
end
