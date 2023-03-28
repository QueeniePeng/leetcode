# You want to calculate the minimum energy in joules it will take you to complete a game of "jumping staircase." This is how the game is played:

# You start from the first step in the staircase.
# Each step on staircase has a number written on it that represents the number of steps you can jump over from that point.
# Each jump requires k joules of energy, regardless of how many steps you're jumping over.
# The game ends when you reach the last step or jump over it.

# Your task is to find the minimum energy needed to go to the last step or jump over it, in a staircase of n  steps and an energy requirement of k joules.

# minEngergy(6, 4, [1,2,3,4,5,6])
# Output 12
# Starting from the first step, we can jump one step and go to the second one, expending four joules in energy as we do so. From there we can jump two more steps, expending four more joules of energy. That takes us to the fourth step, from which we can jump four more steps expending four more joules of energy. We have now jumped over the final step in the staircase. Since it too us three steps to do so, we have expended 12 joules

# Here's how the function works:

# It takes in three parameters: n (the number of steps in the staircase), k (the energy requirement for each jump), and the staircase array (which represents the number of steps that can be jumped over from each point).
# It initializes an array energy of size n, where n is the number of steps in the staircase. This array will store the minimum energy needed to reach each step.
# It sets the energy requirement for the first step to 0 since it doesn't require any energy to reach.
# It then loops through each step in the staircase array and for each step, it loops through each possible number of steps that can be jumped over from that point.
# For each possible next step, it calculates the minimum energy needed to reach that step by adding the energy requirement k to the energy required to reach the current step. It then updates the energy array with the minimum energy required to reach the next step.
# If the next step is the last step in the staircase, it updates the energy array with the minimum energy required to jump over the last step.
# After all the steps have been processed, the function returns the minimum energy required to reach the last step or jump over it, which is stored in the last element of the energy array.

def minEnergy(n, k, jumps)
  # Insert your code here
  min_jumps = (0..n).to_a.map { |_| 0 }
  i = 0
  loop do
    first = i + 1
    last = i + jumps[i]
    last = n - 1 if last >= n
    next_index = first
    (first..last).each do |j|
      next_index = j if jumps[j] + j > jumps[next_index] + next_index

      min_jumps[j] = min_jumps[first - 1] + 1 if min_jumps[j]
    end
    i = next_index
    break if last == n - 1
  end
  min_jumps[n - 1] * k
end

def min_energy(n, k, jumps)
  energy = Array.new(n, Float::INFINITY)
  energy[0] = 0

  (0..n - 1).each do |i|
    (1..jumps[i]).each do |j|
      if i + j < n
        energy[i + j] = [energy[i + j], energy[i] + k].min
      else
        energy[-1] = [energy[-1], energy[i] + k].min
      end
    end
  end
  print energy
  energy[-1]
end

require 'test/unit'

class TestMinEngergy < Test::Unit::TestCase
  def test_
    assert_equal 12, min_energy(6, 4, [1, 2, 3, 4, 5, 6])
    assert_equal 4, min_energy(2, 4, [1, 1])
    assert_equal 300, min_energy(8, 60, [1, 1, 2, 1, 1, 2, 5, 3])
    assert_equal 1064, min_energy(15, 76, [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
  end
end
