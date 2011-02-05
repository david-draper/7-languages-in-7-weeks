 #!/usr/bin/env ruby
 require 'rubygems'
 require 'hpricot'
 require 'net/http'
 
 $username = 'agiletips'
 $password = 'c0mputer'
 
 def twitter(command, opts={}, type=:get)
   # Open an HTTP connection to twitter.com
   twitter = Net::HTTP.start('twitter.com')
 
   # Depending on the request type, create either
   # an HTTP::Get or HTTP::Post object
   case type
   when :get
     # Append the options to the URL
     command << "?" + opts.map{|k,v| "#{k}=#{v}" }.join('&')
     req = Net::HTTP::Get.new(command)
 
   when :post
     # Set the form data with options
     req = Net::HTTP::Post.new(command)
     req.set_form_data(opts)
   end
 
   # Set up the authentication and
   # make the request
   req.basic_auth( $username, $password )
   res = twitter.request(req)
 
   # Raise an exception unless Twitter
   # returned an OK result
   unless res.is_a? Net::HTTPOK
     doc = Hpricot(res.body)
     raise "#{(doc/'request').inner_html}: #{(doc/'error').inner_html}"
   end
 
   # Return the request body
   return Hpricot(res.body)
 end
 
 xml = twitter(
   '/statuses/update.xml',
   { 'status' => ARGV[0] },
   :post
 )
 
 puts xml