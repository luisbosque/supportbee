# Supportbee

Ruby client to work with Supportbee API (https://developers.supportbee.com/api)

## Installation

```Bash
gem install supportbee
```

## Usage

```ruby
require 'supportbee'

sb = Supportbee::Client.new(:company => 'my_company', :auth_token => 'my_auth_token') 

tickets = sb.tickets

```
