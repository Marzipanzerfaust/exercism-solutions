return {
  transform = function(dataset)
    local output = {}

    for key, values in pairs(dataset) do
      for i = 1, #values do
        output[values[i]:lower()] = key
      end
    end

    return output
  end
}
