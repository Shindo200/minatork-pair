class Amida
  attr_reader :player, :row, :hit

  def initialize(player_count)
    @player_count = player_count
    @player = []
    @row = []
    @hit = Array.new(@player_count,"    ")

    setting_player
    setting_hit
  end

  def setting_player
    1.upto(@player_count) do |i|
      @player << (64 + i).chr
    end
  end

  def line
    current_row = []

    1.upto(@player_count) do |i|
      current_row << "|"
      current_row << "   "
    end

    pos = rand(@player_count) * 2 + 1
    current_row[pos] = "---"
    current_row.pop
    current_row.push("\n")
    @row << current_row
  end

  def setting_hit
    pos = rand(@player_count)
    @hit[pos] = "!!!"
  end
end

amida = Amida.new(ARGV[0].to_i)
0.upto(10) {amida.line}

puts amida.player.join("   ")
puts amida.row.join
puts amida.hit.join
