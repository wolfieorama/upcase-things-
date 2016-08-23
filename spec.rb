# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.

class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  # implement your behavior here

  def fullname(first_name:, middle_name: nil, last_name:)
    a = []
    a.push("#{first_name}", "#{middle_name}", "#{last_name}")
    a.join(" ").squeeze
  end

  def namewithinitial(first_name:, middle_name: nil, last_name:)
    a = []
    a.push("#{first_name}", "#{middle_name}".chars.first, "#{last_name}")
    a.join(" ").squeeze
  end

  def initialonly(first_name:, middle_name: nil, last_name:)
    a = []
    a.push("#{first_name}".chars.first, "#{middle_name}".chars.first, "#{last_name}".chars.first)
    a.join(" ").squeeze
  end


end

RSpec.describe Person do

  let(:person_with_middle_name) { Person.new(first_name: "John", middle_name: "Wachira", last_name: "Munyi") }
  let(:person_without_middle_name) { Person.new(first_name: "John", last_name: "Munyi") }


  describe "#full_name" do
    it "concatenates first name, middle name, and last name with spaces" do
      expect(person_with_middle_name.fullname(first_name: "John", middle_name: "Wachira", last_name: "Munyi")).to eq("John Wachira Munyi")
    end

    it "does not add extra spaces if middle name is missing" do
      expect(person_without_middle_name.fullname(first_name: "John", last_name: "Munyi")).to eq("John Munyi")
    end
  end

  describe "#full_name_with_middle_initial" do
    it "return a full name with a middle initial" do
      # person = Person.new(first_name: "John", middle_name: "Wachira", last_name: "Munyi")
      expect(person_with_middle_name.namewithinitial(first_name: "John", middle_name: "Wachira", last_name: "Munyi")).to eq("John W Munyi")
    end

    it "return a full name with a middle initial with no extra" do
      expect(person_without_middle_name.namewithinitial(first_name: "John", last_name: "Munyi")).to eq("John Munyi")
    end
  end

  describe "#initials" do
    it "return 3 initials for person with 3 names" do
        expect(person_with_middle_name.initialonly(first_name: "John", middle_name: "Wachira", last_name: "Munyi")).to eq("J W M")
    end

    it "return 3 initials for person with 3 names" do
        expect(person_without_middle_name.initialonly(first_name: "John", last_name: "Munyi")).to eq("J M")
    end
  end
end
