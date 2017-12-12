# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


require 'mercadopago.rb'
$mp = MercadoPago.new(ENV['MERCADOPAGO_KEY'])


paymentInfo = $mp.get ("/v1/payments/9119110");

puts paymentInfo
