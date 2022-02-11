class ApartmentRepresenter
  def initialize(apartment)
    @apartment = apartment
  end

  def as_json
    {
      door_number: apartment.name,
      vacant: apartment.vacant,
      block_name: apartment.block.name,
      location: apartment.location,
      rent: apartment.rent
    }
  end

  private

  attr_reader :apartment
end
