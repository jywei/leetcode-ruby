# @param {Integer[][]} box_types
# @param {Integer} truck_size
# @return {Integer}
def maximum_units(box_types, truck_size)
    sorted_array = box_types.sort_by { |ele| -ele[1] }

    current_size = 0
    final_units = 0

    sorted_array.each do |num_of_boxes, unit|
       consumed_boxes = [truck_size - current_size, num_of_boxes].min
       final_units += unit * consumed_boxes
       current_size += consumed_boxes
    end

    final_units
end
