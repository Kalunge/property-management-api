class BlocksRepresenter
  def initialize(blocks)
    @blocks = blocks
  end

  def as_json
    blocks.map do |block|
      {
        id: block.id,
        name: block.name,
        location: block.location,
        owner: block.user.name
      }
    end
  end

  private

  attr_reader :blocks
end
