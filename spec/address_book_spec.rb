require_relative '../models/address_book'

RSpec.describe AddressBook do

  let(:book) { AddressBook.new }

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eq expected_name
    expect(entry.phone_number).to eq expected_number
    expect(entry.email).to eq expected_email
  end

  describe "#binary_search" || "iterative_search" do
    before { book.import_from_csv(csv_file) }
      describe "using sample csv file #1" do
        let (:csv_file) {"entries.csv"}

          it "searches AddressBook for a non-existent entry" do
            entry = book.binary_search("Dan")
            expect(entry).to be_nil
          end

          it "searches AddressBook for Bill" do
            entry = book.binary_search("Bill")
            expect(entry).to be_a Entry
            check_entry(entry, "Bill", "555-555-4854", "bill@blocmail.com")
          end

          it "searches AddressBook for Bob" do
            entry = book.binary_search("Bob")
            expect(entry).to be_a Entry
            check_entry(entry, "Bob", "555-555-5415", "bob@blocmail.com")
          end

          it "searches AddressBook for Joe" do
            entry = book.binary_search("Joe")
            expect(entry).to be_a Entry
            check_entry(entry, "Joe", "555-555-3660", "joe@blocmail.com")
          end

          it "searches AddressBook for Sally" do
            entry = book.binary_search("Sally")
            expect(entry).to be_a Entry
            check_entry(entry, "Sally", "555-555-4646", "sally@blocmail.com")
          end

          it "searches AddressBook for Sussie" do
            entry = book.binary_search("Sussie")
            expect(entry).to be_a Entry
            check_entry(entry, "Sussie", "555-555-2036", "sussie@blocmail.com")
          end

          it "searches AddressBook for Billy" do
            entry = book.binary_search("Billy")
            expect(entry).to be_nil
          end
      end
  end

  describe "attributes" do
    it "responds to entries" do
      expect(book).to respond_to(:entries)
    end

    it "initializes entries as an array" do
      expect(book.entries).to be_an(Array)
    end

    it "initializes entries an empty" do
      expect(book.entries.size).to eq(0)
    end
  end

  describe "#add_entry" do
    it "adds only one entry to the address book" do
      book.add_entry('Ada Lovelace', '010.012.1815', 'Augustina.king@lovelace.com')
      expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
      book.add_entry('Ada Lovelace', '010.012.1815', 'Augustina.king@lovelace.com')
      new_entry = book.entries[0]
      check_entry(new_entry, 'Ada Lovelace', '010.012.1815', 'Augustina.king@lovelace.com')
    end
  end

  describe "#import_from_csv" do
    before { book.import_from_csv(csv_file) }
      describe 'using sample csv file #1' do
        let (:csv_file) { "entries.csv" }
          it "imports the correct number of entries" do
            book_size = book.entries.size
            expect(book_size).to eq 5
          end

          it "imports the 1st entry" do
            entry_one = book.entries[0]
            check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
          end

          it "imports the 2nd entry" do
            entry_two = book.entries[1]
            check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
          end

          it "imports the 3rd entry" do
            entry_three = book.entries[2]
            check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
          end

          it "imports the 4th entry" do
            entry_four = book.entries[3]
            check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
          end

          it "imports the 5th entry" do
            entry_five = book.entries[4]
            check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
          end
      end

      describe 'using sample csv file #2' do
        let (:csv_file) { "entries_2.csv" }
          it "imports the correct number of entries" do
            book_size = book.entries.size
            expect(book_size).to eq 3
          end

          it "imports the entries" do
            expect(book.entries).to include(Entry.new("Rick", "250-378-5661", "rick@gmail.com"), Entry.new("Patti", "250-525-1166", "patti@gmail.com"), Entry.new("Kanena", "250-378-1111", "kanena@gmail.com"))
          end

          #OR
          # expect(entry_one).to eq(Entry.new("Rick", "250-378-5661", "rick@gmail.com"))
          # expect(entry_two).to eq(Entry.new("Patti", "250-525-1166", "patti@gmail.com"))
          # expect(entry_three).to eq(Entry.new("Kanena", "250-378-1111", "kanena@gmail.com"))

          #OR

          # it "imports the 1st entry" do
          #   entry_one = book.entries[0]
          #
          #   check_entry(entry_one, "Rick", "250-378-5661", "rick@gmail.com")
          # end
          #
          # it "imports the 2nd entry" do
          #   entry_two = book.entries[1]
          #
          #   check_entry(entry_two, "Patti", "250-525-1166", "patti@gmail.com")
          # end
          #
          # it "imports the 3rd entry" do
          #   entry_three = book.entries[2]
          #
          #   check_entry(entry_three, "Kanena", "250-378-1111", "kanena@gmail.com")
          # end
      end
    end

  describe '#remove_entry' do
    it 'removes an entry' do
      book.add_entry('Ada Lovelace', '010.012.1815', 'Augustina.king@lovelace.com')
      book.remove_entry('Ada Lovelace', '010.012.1815', 'Augustina.king@lovelace.com')
      expect(book.entries.size).to eq(0)
    end

    it 'removes only one entry' do
      book.add_entry('Ada Lovelace', '010.012.1815', 'Augustina.king@lovelace.com')
      book.add_entry('Ada Lovelace', '010.012.1816', 'Augustina.king@lovelace.com')
      book.remove_entry('Ada Lovelace', '010.012.1815', 'Augustina.king@lovelace.com')
      expect(book.entries.size).to eq(1)
    end

    it 'removes the right entry' do
      book.add_entry('Ada Lovelace', '010.012.1816', 'Augustina.king@lovelace.com')
      book.add_entry('Ada Lovelace', '010.012.1815', 'Augustina.king@lovelace.com')
      book.remove_entry('Ada Lovelace', '010.012.1815', 'Augustina.king@lovelace.com')
      expect(book.entries.first.phone_number).to eq('010.012.1816')
    end
  end
end
