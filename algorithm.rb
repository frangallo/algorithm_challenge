def qs (first, last, array)

  if first >= last
    return array
  else
    pivot = random_qs(first, last, array)
    qs(first, pivot-1, array)
    qs(pivot+1, last, array)
  end

end

def random_qs(first, last, array)
  random_num = rand(first..last)
  array[random_num], array[last] = array[last], array[random_num]
  sort(first, last, array)
end

def sort(first, last, array)
  pivot = array[last]
  pivot_num = first
  first.upto(last-1) do |el|
    if array[el] <= pivot
      array[pivot_num], array[el] = array[el], array[pivot_num]
      pivot_num +=1
    end
  end
  array[pivot_num], array[last] = array[last], array[pivot_num]
  pivot_num
end


p qs(0,4, [6,5,4,3,2])


def merge_sort(array)
  if array.length <= 1
    return array
  end

  mid = array.length/2
  left = array.take(mid)
  right = array.drop(mid)

  merge(merge_sort(left),merge_sort(right))
end

def merge(left,right)
  results = []
  until left.empty? || right.empty?
    if left[0] < right[0]
      results << left.shift
    elsif left[0] == right[0]
      results << left.shift
    elsif left[0] > right[0]
      results << right.shift
    end
  end

  results + left + right  
end
