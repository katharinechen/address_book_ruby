require 'rspec'
require 'address_book'
require 'phone'

describe :Contact do

  it "should initialize an address book with a name, phone number, email, and mailing address" do
    new_contact = Contact.new("Michael", 1231231234, "michael@epicodus.com", "123 Lowell Lane")
    expect(new_contact.name).to eq("Michael")
    expect(new_contact.number).to eq(1231231234)
    expect(new_contact.email).to eq("michael@epicodus.com")
    expect(new_contact.address).to eq("123 Lowell Lane")
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

  describe '.remove' do
    it "delete seletected contact" do
      new_contact = Contact.new("Michael", 1231231234, "michael@epicodus.com", "123 Lowell Lane")
      new_contact.save
      Contact.remove(new_contact)
      expect(Contact.all).to eq([])
    end
  end
end

describe :Phone do

  it "should initialize with a name and an empty number array" do
    new_phone = Phone.new("Katharine")
    expect(new_phone.name).to eq("Katharine")
    expect(new_phone.number).to eq("")
  end

  describe '.add' do
    it "should add multiple numbers to a specific person" do
      new_phone = Phone.new("Katharine")
      new_phone.add(1111111111)
      new_phone.add(2222222222)
      expect(new_phone.number).to eq("1111111111,2222222222")
    end
  end

  describe '.all' do
    it "is empty at first" do
     expect(Phone.all).to eq ([])
    end
  end

  describe '.all' do
    it "should add a phone number to the right object" do

        new_phone = Phone.new("Katharine")
        new_phone1 = Phone.new("Michael")
        new_phone.save
        new_phone1.save
        new_phone.add(1111111111)
        new_phone1.add(2222222222)
        expect(Phone.all).to eq([new_phone, new_phone1])
      end
  end

end
