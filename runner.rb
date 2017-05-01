require_relative 'lib/mine'
require_relative 'lib/minesweeper'

input_path  = ARGV.shift || './mines.txt'
output_path = ARGV.shift || './results.txt'

coords = File.read(input_path)

mines = coords.split(/\n/).map do |line|
  Mine.new(*line.split(/\s/).map(&:to_f))
end

output = Minesweeper.new(mines).sorted_results.join("\n")

File.open(output_path, 'w').write(output)
