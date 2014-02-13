require_relative '../../db/config'


class CongressMember < ActiveRecord::Base

  def self.find_by_state(state)
    reps = []
    senators = []
    CongressMember.where(state: state).each do |legislator|
      senators << "   #{legislator.firstname} #{legislator.lastname} (#{legislator.party})" if legislator.title == "Sen"
      reps << "   #{legislator.firstname} #{legislator.lastname} (#{legislator.party})" if legislator.title == "Rep"
    end
    puts "Senators:"
    puts senators
    puts ""
    puts "Representatives:"
    puts reps
  end

  def self.find_active_legislators(gender)
    reps = []
    senators = []
    CongressMember.where(in_office: 1).each do |legislator|
      senators << "#{legislator.gender}" if legislator.title == "Sen"
      reps << "#{legislator.gender}" if legislator.title == "Rep"
    end

    puts "#{gender} Senators: #{senators.count(gender.upcase[0])} (#{self.percentage(senators, gender)}%)"
    puts "#{gender} Representatives: #{reps.count(gender.upcase[0])} (#{self.percentage(reps, gender)}%)"
  end

  def self.percentage(legislators, gender)
    (legislators.count(gender.upcase[0]) * 100/legislators.length)
  end

  def self.states
    result = []
    CongressMember.states_list.each do |state|
      senators = CongressMember.where(state: state, in_office: 1,title: "Sen").length
      reps = CongressMember.where(state: state, in_office: 1, title: "Rep").length
      result << [state, senators, reps]
    end
    result.sort_by{|x| x[2]}.reverse.each {|row| p "#{row[0]}: #{row[1]} Senators, #{row[2]} Representative(s)" unless row [1] == 0}
  end

  def self.states_list
    states = []
    CongressMember.all.each {|legislator| states << legislator.state if legislator.in_office == 1}
    states.uniq
  end

  def self.total_numbers
    puts "Senators: #{CongressMember.where(title: "Sen").length}"
    puts "Representatives: #{CongressMember.where(title: "Rep").length}"
  end

  def self.total_active
    puts "Senators: #{CongressMember.where(title: "Sen", in_office: 1).length}"
    puts "Representatives: #{CongressMember.where(title: "Rep", in_office: 1).length}"
  end
end
