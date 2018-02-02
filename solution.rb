# Solution to the problem on https://gist.github.com/DavidIvy003/4ff8cd3eac07bcae2a2451dda28a0a54
# By Pragam Manoj Gandhi

require 'minitest/autorun'


def up(x, y)
    return x, y + 1
end

def down(x, y)
    return x, y - 1
end

def left(x, y)
    return x - 1, y
end

def right(x, y)
    return x + 1, y
end 


def find_next_xy(x, y)
    # returns the coordinates of the next cell in the spiral data grid  
    
    # check if x,y is origin
    if x == 0 and y == 0
        return 1, 0
    end

    # check if x,y is corner
    if x.abs == y.abs
        if y > 0
            if x > 0
                return left(x, y)
            else
                return down(x, y)  
            end
        else
            return right(x, y)  
        end
    end

    if x > 0 and y.abs < x
         return up(x, y)
    end
    if y > 0 and x.abs < y
        return left(x, y)
    end
    if x < 0 and y.abs < x.abs
        return down(x, y)
    end
    if y < 0 and x.abs < y.abs
        return right(x, y)
    end
end

def find_manhattan_distance_general input_number
    # returns the manhattan_distance for general case when the natural numbers(1,2,3,4.....) are filled spirally in the grid  

    #check if input_number is 1, if so return 0
    if input_number == 1
        return 0
    end

    x, y = 0, 0
    value = 1
    while true
        (x, y) = find_next_xy(x, y)
        value += 1
        if value == input_number
            return x.abs + y.abs  # return manhattan distance            
        end
    end
end

def find_manhattan_distance_data_grid input_number
    # returns the manhattan distance of the first value written in the data grid that is larger than the input_number

    # check if the input_number if less than or equal to 0, return 0 if true
    # handle this edge case because 1 occurs twice in the data grid

    if input_number <= 0
        return 0
    end

    # hashmap to map(x,y) to the cell value
    $data_grid = {}  
    
    def cell_value(x, y)
        #returns the cell value by finding sum of adjacent cells

        sum = 0
        for p in -1..1
            for q in -1..1
                if p == 0 and q == 0
                    next
                end
                adjacent_value = $data_grid[[x + p, y + q]]
                if adjacent_value
                    sum += adjacent_value
                end
            end
        end
        return sum
    end

    x, y = 0, 0
    value = 1
    i = 1 # i is used to see how many times the loop runs so that find_manhattan_distance_general can be called for that i
    $data_grid[[x, y]] = value
    while true
        # loop to find the larger value in data grid than the input_number
        i += 1
        x, y = find_next_xy(x, y)
        value = cell_value(x, y)
        $data_grid[[x, y]] = value
        if value > input_number
            #puts value
            return find_manhattan_distance_general i  # pass i to find_manhattan_distance_general
        end
    end
end



# Tests

class Find_manhattan_distance_data_gridTest < ::MiniTest::Test
    def test_1
        assert_equal 2, find_manhattan_distance_data_grid(4)
    end

    def test_2
        assert_equal 1, find_manhattan_distance_data_grid(9)
    end

    def test_3
        assert_equal 2, find_manhattan_distance_data_grid(23)
    end
    def test_4
        assert_equal 3, find_manhattan_distance_data_grid(879)
    end
    def test_5
        assert_equal 4, find_manhattan_distance_data_grid(361)
    end
    def test_6
        assert_equal 3, find_manhattan_distance_data_grid(807)
    end
    def test_6
        assert_equal 2, find_manhattan_distance_data_grid(1)
    end
    def test_7
        assert_equal 1, find_manhattan_distance_data_grid(5)
    end

    def test_8
        assert_equal 0, find_manhattan_distance_data_grid(0)
    end

    def test_9
        assert_equal 0, find_manhattan_distance_data_grid(-5)
    end    

    def test_10
        assert_equal 1, find_manhattan_distance_general(2)
    end

    def test_11
        assert_equal 0, find_manhattan_distance_general(1)
    end

    def test_12
        assert_equal 2, find_manhattan_distance_data_grid(23)
    end

    def test_13
        assert_equal 4, find_manhattan_distance_data_grid(1024)
    end

    # more tests cab be added below
end