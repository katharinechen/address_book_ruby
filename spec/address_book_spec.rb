require 'rspec'
require 'address_book'

describe :Contact do

  it "should initialize an address book with a name, phone number, email, and mailing address" do
    new_contact = Contact.new("Michael", 1231231234, "michael@epicodus.com", "123 Lowell Lane")
    expect(new_contact.name).to eq("Michael")
    expect(new_contact.number).to eq([1231231234])
    expect(new_contact.email).to eq(["michael@epicodus.com"])
    expect(new_contact.address).to eq(["123 Lowell Lane"])
  end

  describe '.all' do

    it "is empty at first" do
     expect(Contact.all).to eq ([])

    end
  end

  describe '#save' do

    it "adds a contact to the array of saved tasks" do
      new_contact = Contact.new("Michael", 1231231234, "michael@epicodus.com", "123 Lowell Lane")
      new_contact.save
      expect(Contact.all).to eq([new_contact])
    end


  end

  describe '.clear' do
    it 'empties the list of contacts' do
      new_contact = Contact.new("Michael", 1231231234, "michael@epicodus.com", "123 Lowell Lane")
      new_contact.save
      expect(Contact.clear).to eq ([])
    end
  end


end
