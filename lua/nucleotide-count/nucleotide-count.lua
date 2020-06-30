local DNA = {}

function DNA:new(strand)
  new = {
    nucleotideCounts = { A = 0, T = 0, C = 0, G = 0 }
  }

  for i = 1, #strand do
    local c = strand:sub(i, i)
    new.nucleotideCounts[c] = new.nucleotideCounts[c] + 1
  end

  self.__index = self
  return setmetatable(new, self)
end

function DNA:count(nucleotide)
  if not self.nucleotideCounts[nucleotide] then
    error("Invalid Nucleotide")
  end

  return self.nucleotideCounts[nucleotide]
end

return DNA
