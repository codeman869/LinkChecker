#!/usr/bin/env ruby

require 'httparty'
require 'pp'

class POL
    APPNAME = "EBS Time Request Link Check"
    include HTTParty
    base_uri 'https://www.portlandonline.com'
    headers "User-Agent" => APPNAME
end
100.times do
    response = POL.get('/timereq/')
    if response.code == 404
        puts response.body, response.code, response.message, response.headers.inspect
        f = File.open("POL.log","a+")
        f.write("#{response.body} #{response.code} #{response.message} #{response.headers.inspect}\n")
        f.close
    end

    pp response.code

    sleep(10)
end