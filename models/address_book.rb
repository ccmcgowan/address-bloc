require_relative 'entry'
require "csv"

class AddressBook
  attr_reader :entries

  def initialize
    @entries = []
  end

  def add_entry(name, phone_number, email)
    index = 0
    entries.each do |entry|
      if name < entry.name
        break
      end
      index += 1
    end
    entries.insert(index, Entry.new(name, phone_number, email))
  end

  def remove_entry(name, phone_number, email)
    entries.delete(Entry.new(name, phone_number, email))

    # target_entry = nil
    # entries.each do |entry|
    #   if entry.name == name && entry.phone_number == phone_number && entry.email == email
    #     target_entry = entry
    #   end
    # end
    # entries.delete(target_entry)
  end

  def import_from_csv(file_name)
  end
end
