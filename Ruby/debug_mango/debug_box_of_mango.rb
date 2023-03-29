def max_mangoes(n, m)
  matrix = Array.new(n) { Array.new(m) }
  (0...n).each do |i|
    (0...m).each do |j|
      matrix[i][j] = ((2**(i + 1)) + ((j + 1) * ((i + j + 2)))) % 10_005
    end
  end
  (0...n).to_a.reverse.each do |i|
    (0...m).to_a.reverse.each do |j|
      if i == (n - 1) && j == (m - 1)
        next
      elsif i == (n - 1)
        matrix[i][j] += matrix[i][j + 1]
      elsif j == (m - 1)
        matrix[i][j] += matrix[i + 1][j]
      else
        matrix[i][j] -= [matrix[i][j + 1], matrix[i - 1][j]].max
      end
    end
  end

  matrix[0][0]
end

def max_mangoes(n, m)
  matrix = Array.new(n) { Array.new(m) }
  (0...n).each do |i|
    (0...m).each do |j|
      matrix[i][j] = ((2**(i + 1)) + ((j + 1) * ((i + j + 2)))) % 10_005
    end
  end
  n.downto(0).each do |i|
    m.downto(0).each do |j|
      if i == (n - 1) && j == (m - 1)
        next
      elsif i == (n - 1)
        matrix[i][j] += matrix[i][j + 1]
      elsif j == (m - 1)
        matrix[i][j] += matrix[i + 1][j]
      else
        matrix[i][j] += [matrix[i][j + 1], matrix[i + 1][j]].max
      end
    end
  end

  matrix[0][0]
end
