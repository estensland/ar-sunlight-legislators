require_relative '../app/models/congress_member'

require_relative '../db/config'

p CongressMember.all.length

# Get all senators:
# CongressMember.where(title: "Sen").each do |senator|
#   p "#{senator.firstname} #{senator.lastname} (#{senator.party})"
# end

# Get all senators:
# CongressMember.where(state: "Sen").each do |senator|
#   p "#{senator.firstname} #{senator.lastname} (#{senator.party})"
# end

# Get all congressmen_(How bout Illinois?):
# CongressMember.find_by_state("IL")

# p CongressMember.where(in_office: 1)

CongressMember.find_active_legislators("male")
CongressMember.find_active_legislators("female")


CongressMember.states

puts

CongressMember.total_numbers

puts


CongressMember.total_active
