require 'rubygems'
require 'supportbee'

sb = Supportbee::Client.new(:company => '', :auth_token => '')

# Fetch all tickets
tickets = sb.tickets

# Select only those tickets that are unanswered
ut = tickets.select {|ut| ut['unanswered'] }

# Initialize a ticket counter for each agent
raw_users = sb.agents
users = {}
raw_users.each do |u| 
  users[u['name']] = 0
end

# Initialize a ticket counter for each group
raw_groups = sb.groups
groups = {}
raw_groups.each do |g| 
  groups[g['name']] = 0
end

unassigned = 0
total = 0

# Iterate through all the unanswered tickets and increment the users and
# groups counters
ut.each do |t|
  if t['current_assignee'].nil?
    unassigned = unassigned + 1
  elsif !t['current_assignee']['user'].nil?
    users[t['current_assignee']['user']['name']] = users[t['current_assignee']['user']['name']] + 1
  elsif !t['current_assignee']['group'].nil?
    groups[t['current_assignee']['group']['name']] = groups[t['current_assignee']['group']['name']] + 1
  end
end

puts "Unanswered tickets"
puts "------------------"
puts ""

puts "Unassigned: #{unassigned}"
total = total + unassigned
puts ""

puts "Users"
users.each do |n,c|
  if c > 0
    puts "  #{n}: #{c}"
    total = total + c
  end
end
puts ""

puts "Groups"
groups.each do |n,c|
  if c > 0
    puts "  #{n}: #{c}"
    total = total + c
  end
end
puts ""

puts "Total: #{total}"
