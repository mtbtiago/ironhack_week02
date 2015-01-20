class SL4
  def first_method(numbers)
    positive_count = numbers.count {|num| num if num >= 0}
    negative_count = numbers.count {|num| num if num < 0}
    if positive_count == negative_count
      return nil
    else
      positives = positive_count > negative_count
    end
    numbers.select{|num|
      if positives
        num if num >= 0
      else
        num if num < 0
      end
    }
  end

  def second_method(numbers)
    # mode, median, mean, size
    return nil if numbers.empty?
    mode = calc_mode(numbers)
    median = calc_median(numbers)
    mean = calc_mean(numbers)
    [mode,median,mean,numbers.size]
  end

  def third_method(num)
    # http://en.wikipedia.org/wiki/Memoization
    return nil if num <= 0
    return 1 if num <= 2
    @lookup ||= {}
    @lookup[num] = third_method(num-1) + third_method(num-2)
  end

  private

  def recursive_fibonacci(num)
    return nil if num <= 0
    return 1 if num <= 2
    recursive_fibonacci(num-1) + recursive_fibonacci(num-2)
  end

  def not_recursive_fibonacci(num)
    fibo = [0,1]
    i = 1
    while i < num
      fibo << fibo[i-1] + fibo[i]
      i += 1
    end
    fibo[fibo.size - 1]
  end

  def calc_mode(numbers)
    hash = Hash.new(0)
    numbers.each {|n| hash[n] += 1 }
    result = []
    hash.each {|key, value|
      if value == hash.values.max
        result << key
      end
    }
    result.sort
  end

  def calc_median(numbers)
    # numbers = [1,2,2,4,5,7]
    return 0 if numbers.size == 0
    num = numbers.sort
    if num.size % 2 == 0
      center = num.slice((num.size / 2)-1,2)
      (center[0] + center[1]) / 2
    else
      num.slice[num.size / 2]
    end
  end

  def calc_mean(numbers)
    sum = numbers.reduce(0) {|result, n| result += n}
    sum / numbers.size
  end
end
