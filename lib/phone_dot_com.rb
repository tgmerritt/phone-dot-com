class PhoneDotCom
  include ActionView::Helpers::NumberHelper
  require 'erb'
  require "net/http"
  require "uri"

  def self.send_new_sms(from,to,msg)
    sms_header
    @request.body = ({"from" => from, "to" => to, "message" => msg}).to_json
    puts @request.body
    response = @http.request(@request)
    # puts response.body
  end

  def self.sms_header
    uri = URI.parse("https://v1.api.phone.com/sms")
    # Full control
    @http = Net::HTTP.new(uri.host, uri.port)
    @http.use_ssl = true
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    @request = Net::HTTP::Post.new(uri.request_uri)
    @request["Accept"] = "text/json"
    @request["Content-Type"] = "text/json"
    @request.basic_auth(ENV['PHONE_DOT_COM_KEY'],ENV['PHONE_DOT_COM_PASSWORD'])
    # @request.body = ({"from" => "+13477742512", "to" => "+14242987773", "message" => "Test from Field Harmony"}).to_json
    return @request
  end

end