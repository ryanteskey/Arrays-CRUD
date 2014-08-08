############################################################
#
#  name:        Ryan Teskey
#  Assignment:  Assignment 6
#  Date:        2/2/2011
#  Class:       CIS 282
#  Description: makes a menu driven program
#
############################################################

people = %w{tom harry dick troy hal don ryan pop}
ages = [60, 20, 30, 21, 25, 45, 19, 5]

def menu_selection
  puts '1 = Create', '2 = Read', '3 = Update', '4 = Delete', '5 = Quit'
  puts '6 = view all people', '7 = view all people that begin with a letter'
  puts '8 = view youngest and oldest person', '9 = all people younger than 21'
end

menu_selection
menu_selection = ''
puts people.inspect
puts ages.inspect

while menu_selection != '5' do
  menu_selection
  print 'put in the number from the list: '
  menu_selection = gets.chomp

  if( menu_selection == '1' )
    print 'Name: '
    people << gets.chomp
    print 'Age: '
    ages << gets.chomp
    puts people.inspect
    puts ages.inspect
  elsif( menu_selection == '2' )
     count = 0
    while count < people.length
      puts "name: #{people.fetch(count)}", "age: #{ages.fetch(count)}"
      count += 1
    end
  elsif( menu_selection == '3' )
    count = 0
    while count < people.length
      print "#{count}: "
      puts people.fetch(count)
      count += 1
    end
    print 'what is the number of the person to update: '
    user_choice = gets.to_i
    print 'Name:'
    people[user_choice] = gets.chomp
    print 'Age:'
    ages[user_choice] = gets.to_i

  elsif( menu_selection == '4' )
    count = 0
    while count < people.length
      print "#{count}: "
      puts people.fetch(count)
      count += 1
    end
    print 'what is the number of the person to DELETE: '
    user_choice = gets.to_i
    people.delete_at(user_choice)
    ages.delete_at(user_choice)

  elsif( menu_selection == '6' )
    puts people
  elsif( menu_selection == '7' )
    index = 0
    sum = 0
    print 'put in the first letter for the name:'
    letter = gets.chomp.downcase
    while index < people.length
      if people[index].downcase.slice(0,1) == letter
        sum += 1
        puts people[index]
      end
      index += 1
    end
  elsif( menu_selection == '8' )
    puts "#{people[ages.each_with_index.min[1]]} is the youngest at #{ages.min}",
         "#{people[ages.each_with_index.max[1]]} is the oldest at #{ages.max}"
  elsif( menu_selection == '9' )
    index = 0
    smallest_age = 1000
    while index < ages.length
      if ages[index] < 21
        smallest_age = ages[index]
        puts "name: #{people[index]}", " age: #{smallest_age}"
      end
      index += 1
    end
  end
end