class ApartmentsRepresenter
  def initialize(apartments)
    @apartments = apartments
  end

  def as_json
    apartments.map do | apartment |
      {
        name: apartment.name,
        vacant: apartment.vacant,
        block_name: apartment.block.name,
        location: apartment.block.location,
        rent: apartment.rent
      }
    end
  end

  private

  attr_reader :apartments
end