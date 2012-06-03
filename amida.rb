class Amida
  attr_reader :player, :row, :hit

  def initialize(player_count,row_count)
    @player_count = player_count
    @player = []
    @row = []
    @hit = Array.new(@player_count,"    ")

    setting_player
    row_count.times {setting_row}
    setting_hit
  end

  private

  def setting_player
    @player_count.times do |i|
      @player << (65 + i).chr
    end
  end

  def setting_row
    current_row = Array.new(@player_count,"|")
    connect_pos = []

    (@player_count / 2).times do
      next_pos = pc_rand
      unless direct_connect?(connect_pos,next_pos)
        connect_pos << next_pos
      end
    end

    current_row.map!.with_index do |line,pos|
      if connect_pos.index(pos)
        "#{line}---"
      else
        "#{line}   "
      end
    end

    current_row[@player_count - 1] = "|\n"
    @row << current_row
  end

  def setting_hit
    @hit[pc_rand] = "!!!"
  end

  def pc_rand
    rand(@player_count)
  end

  def direct_connect?(connect_pos,next_pos)
    connect_pos.index(next_pos - 1) or connect_pos.index(next_pos + 1)
  end
end

amida = Amida.new(ARGV[0].to_i, 10)

puts amida.player.join("   ")
puts amida.row.join
puts amida.hit.join
