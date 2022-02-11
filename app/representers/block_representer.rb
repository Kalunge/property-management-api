class BlockRepresenter
  def initialize(block)
    @block = block
  end

  def as_json
    {
      id: block.id,
      name: block.name,
      location: block.location,
      owner: block.user.name
    }
  end

  private

  attr_reader :block
end
