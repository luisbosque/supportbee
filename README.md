# Supportbee
[![Gem Version](https://badge.fury.io/rb/supportbee.png)][gem]
[gem]: http://badge.fury.io/rb/supportbee

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
