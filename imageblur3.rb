class Image
  attr_accessor :picture, :distance

  def initialize (picture)
    @picture = picture
  end

  def get_ones
    ones = []
    @picture.each_with_index do |row, row_index|
      row.each_with_index do |item, column_index|
        if item == 1
          ones << [row_index, column_index]
        end
      end
    end
    ones
  end

  def blur(distance)
    ones = get_ones

    @picture.each_with_index do |row, row_index|
      row.each_with_index do |item, column_index|
        ones.each do |found_row_index, found_column_index|
          if manhattan_distance(column_index, row_index, found_column_index, found_row_index) <= distance
            @picture[row_index][column_index] = 1
          end
        end
      end
    end
  end

  def manhattan_distance (x1, y1, x2, y2)
    horizontal_distance = (x2 - x1).abs
    vertical_distance = (y2 - y1).abs
    # (x2 - x1).abs + (y2 - y1).abs
    horizontal_distance + vertical_distance
  end

  def output_image
    @picture.each do |data|
      puts data.join
    end
  end
end

image = Image.new([
[0, 1, 0, 0],
[0, 0, 0, 0],
[0, 0, 0, 1],
[0, 0, 0, 0]
])

# original image
image.output_image
puts

# blurred image
image.blur(2)
image.output_image