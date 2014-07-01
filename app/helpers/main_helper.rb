module MainHelper
  def pow_of_two(x)
    (2 ** x)
  end
  
  def pairs(x)
    x / 2
  end
  
  def format_rupiah(number)
    number_to_currency(number, unit: 'Rp. ', separator: ',', delimiter: '.')
  end
  
  def pairs_fee(level, max_level, fee, members, percentage, max_pairs)
    i = sum = 0
    while i < (max_level - level) do
      sum += [max_pairs, pow_of_two(i)].min
      i += 1
    end
    sum * members * (fee * percentage)
  end
end