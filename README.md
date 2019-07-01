# EnquiryConsul
EnquiryConsul is a very simple service discovery client, rails edition.

I haven't found any Consul client provides services as Hystrix, Load Balancing, etc. in Rails. That's why EnquiryConsul was born. However, it's now in a pretty early phrase, providing basic service discovery, load balancing, breaker functions.

## **You are more than welcome to contribute to this project!**

Please notify me if anyone knows rounded Consul clients in Rails. :)

Please Note:
* Use it in Rails.
* Dependent on Diplomat. It's a rails http wrapper. The only wrapper I've found written in Ruby.
* Config your Consul cluster IP and port with Diplomat.
* Visit Diplomat: https://github.com/WeAreFarmGeek/diplomat

## Installation
Add this to your Gemfile
```
gem 'enquiry-consul'
```

Execute
```
bundle install
```

## Basic Usage
**Available methods (for now): GET, POST, PUT**
```
EnquiryConsul.get(<YourServiceName>, <Api>, data: <Body>, reconnect: <RetryTimes>)
```
## **Have Fun!**
