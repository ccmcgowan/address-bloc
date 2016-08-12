require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - View Entry Number n"
    puts "5 - Import entries from a CSV"
    puts "6 - Exit"
    print "enter your selection ==> "

    selection = gets.to_i

    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        create_entry
        main_menu
      when 3
        system "clear"
        search_entries
        main_menu
      when 4
        system "clear"
        view_entry_number
        main_menu
      when 5
        system "clear"
        read_csv
        main_menu
      when 6
        puts "Good-bye!"
        exit(0)
      else
        system "clear"
        puts "Sorry, that is not a valid input"
        main_menu
    end
  end


  def view_all_entries
    address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      entry_submenu(entry)
    end

    system "clear"
    puts "End of entries"
  end

  def create_entry
    system "clear"
    puts "new AddressBloc Entry"
    print "Name: "
    name = gets.chomp
    print "Phone Number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp

    address_book.add_entry(name, phone, email)

    system "clear"
    puts "New entry created"
  end

  def search_entries
  end

  def view_entry_number

    if address_book.entries.empty?
      puts "There are currently no addresses in the address book.  Please create one first."
    else
      puts "Select the entry number you would like to view: "
      puts "Valid numbers are 1 to #{address_book.entries.size}"
      selection = gets.chomp.to_i
      # if (0..address_book.entries.size).include?(selection)
      if selection <= address_book.entries.size && selection > 0
        entry = address_book.entries[selection - 1]
        puts entry.to_s
        entry_submenu(entry)
      else
        puts "That selection is invalid."
        view_entry_number
      end
    end
  end

  # def view_entry_number
  #   #ask the user which entry they would like to view
  #   puts "Select the entry number you would like to view: "
  #   #get an input
  #   selection = gets.chomp
  #   #determine which entry applies to thier input
  #   case selection
  #   #identify valid entries respective of their index number in the array
  #   #If the index exists "true" then display that entry
  #   when view_all_entries.map.with_index.to_[selection] == true
  #         puts view_all_entries[selection.to_i + 1]
  #     else
  #       #if the index does not exist, return error message and start back at top
  #       system "clear"
  #       puts "#{selection} is not a valid entry"
  #       view_entry_number(entry)
  #   end
  # end

  def read_csv
  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    selection = gets.chomp

    case selection
      when "n"
      when "d"
      when "e"
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
    end
  end
end
